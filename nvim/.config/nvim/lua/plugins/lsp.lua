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
      -- Diagnostics (modern, non-deprecated)
      ------------------------------------------------------------------
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded" },
      })

      -- Global diagnostic keymaps
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
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
        map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
        map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
        map("n", "<leader>D", vim.lsp.buf.type_definition, "Type Definition")
        map("n", "K", vim.lsp.buf.hover, "Hover Docs")

        -- Telescope (safe)
        local ok, tb = pcall(require, "telescope.builtin")
        if ok then
          map("n", "gr", tb.lsp_references, "References")
          map("n", "<leader>ds", tb.lsp_document_symbols, "Document Symbols")
          map("n", "<leader>ws", tb.lsp_workspace_symbols, "Workspace Symbols")
        end

        -- Format
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
          vim.lsp.buf.format({ async = true })
        end, { desc = "Format buffer" })
      end

      ------------------------------------------------------------------
      -- Mason
      ------------------------------------------------------------------
      require("mason").setup()
      require("lazydev").setup()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      ------------------------------------------------------------------
      -- 🔥 FIXED mason-lspconfig usage (THIS WAS THE BUG)
      ------------------------------------------------------------------
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "lua_ls",
        },

        handlers = {
          function(server)
            require("lspconfig")[server].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
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

