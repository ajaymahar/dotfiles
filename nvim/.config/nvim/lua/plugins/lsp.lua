return {
  -- LSP Configuration & Plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim", -- ADD: Lua development support
      "hrsh7th/nvim-cmp",  -- ADD: Completion (required for capabilities)
      "hrsh7th/cmp-nvim-lsp",
      "j-hui/fidget.nvim",
      "nvim-telescope/telescope.nvim", -- ADD: Required for your keymaps
    },
    config = function()
      -- Diagnostic keymaps (global)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Float Diagnostics" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Loclist Diagnostics" })

      -- LSP on_attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        
        -- Helper for buffer-local keymaps
        local bufmap = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = "LSP: " .. desc }))
        end

        -- Core LSP keymaps (modern vim.lsp API)
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        bufmap("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        bufmap("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        bufmap("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        bufmap("n", "<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        bufmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        
        -- Telescope symbols (if available)
        if pcall(require, "telescope.builtin") then
          bufmap("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
          bufmap("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, "[W]orkspace [S]ymbols")
        end

        -- Workspace folder commands
        bufmap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        bufmap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        bufmap("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")

        -- Format command (Neovim 0.10+)
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
          vim.lsp.buf.format({ async = true })
        end, { desc = "Format current buffer" })
      end

      -- Setup Mason
      require("mason").setup()

      -- Neodev for Lua LSP
      require("neodev").setup()

      -- Completion capabilities (Neovim 0.11+)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Servers to install
      local servers = { "gopls", "lua_ls" }
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        handlers = {
          -- Default handler for all servers
          function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
        },
      })

      -- Fidget status
      require("fidget").setup({
        notification = {
          window = { winblend = 0 },
        },
      })
    end,
  },
}

