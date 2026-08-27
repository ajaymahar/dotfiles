return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Lua development (replacement for neodev)
      "folke/lazydev.nvim",

      -- Completion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",

      -- UI
      "j-hui/fidget.nvim",
    },

    config = function()
      ------------------------------------------------------------------
      -- Native Neovim Diagnostics Configuration (Unified & Stable)
      ------------------------------------------------------------------
      vim.diagnostic.config({
        -- Enable native inline virtual text
        virtual_text = {
          spacing = 4,
          prefix = "■",
        },
        -- Define native signcolumn markers on the left gutter
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
          },
        },
        underline = true,
        update_in_insert = false, -- Re-lints cleanly whenever you drop back to Normal Mode
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always", -- Helpful: shows you exactly which server threw the message
        },
      })

      ------------------------------------------------------------------
      -- Global :Format command (safe fallback)
      ------------------------------------------------------------------
      vim.api.nvim_create_user_command("Format", function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients == 0 then
          vim.notify("No LSP attached to format", vim.log.levels.WARN)
          return
        end
        vim.lsp.buf.format({ async = false })
      end, { desc = "Format current buffer via LSP" })

      -- Global diagnostic keymaps
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
      end, { desc = "Prev Diagnostic" })

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
      end, { desc = "Next Diagnostic" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics List" })

      ------------------------------------------------------------------
      -- on_attach
      ------------------------------------------------------------------
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            silent = true,
            desc = "LSP: " .. desc,
          })
        end

        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
        map("n", "<leader>D", vim.lsp.buf.type_definition, "Type Definition")
        map("n", "K", vim.lsp.buf.hover, "Hover Docs")

        -- Telescope (safe check)
        local ok, tb = pcall(require, "telescope.builtin")
        if ok then
          map("n", "gr", tb.lsp_references, "References")
          map("n", "gd", tb.lsp_definitions, "Goto Definition")
          map("n", "<leader>ds", tb.lsp_document_symbols, "Document Symbols")
          map("n", "<leader>ws", tb.lsp_workspace_symbols, "Workspace Symbols")
        end

        -- Buffer-local Format Command
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
          vim.lsp.buf.format({ async = true })
        end, { desc = "Format buffer" })
      end

      ------------------------------------------------------------------
      -- Mason & Lazydev Initialization
      ------------------------------------------------------------------
      require("mason").setup()
      require("lazydev").setup()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      ------------------------------------------------------------------
      -- Automated Server Configuration (Guards against duplicate clients)
      ------------------------------------------------------------------
      local servers = {
        gopls = {},
        lua_ls = {},
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server_opts = servers[server_name] or {}
            server_opts.on_attach = on_attach
            server_opts.capabilities = vim.tbl_deep_extend(
              "force",
              {},
              capabilities,
              server_opts.capabilities or {}
            )

            -- Explicitly registers each required server exactly once
            require("lspconfig")[server_name].setup(server_opts)
          end,
        },
      })

      ------------------------------------------------------------------
      -- Fidget
      ------------------------------------------------------------------
      require("fidget").setup({
        notification = { window = { winblend = 0 } },
      })
    end,
  },
}
