return {
  {
    "ray-x/go.nvim",

    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },

    ft = { "go", "gomod" },
    event = { "BufReadPre", "BufNewFile" },

    build = function()
      require("go.install").update_all_sync()
    end,

    config = function()
      -- =========================
      -- Keymaps
      -- =========================
      vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "K", "<cmd>GoDoc<cr>", { silent = true, noremap = true })

      -- =========================
      -- go.nvim setup
      -- =========================
      require("go").setup({
        disable_defaults = false,

        go = "go",
        goimport = "gopls",
        fillstruct = "gopls",
        gofmt = "golines",
        max_line_len = 128,

        tag_options = "json=omitempty",
        tag_transform = "camelcase",

        gotests_template = "",
        gotests_template_dir = "",

        comment_placeholder = "",

        icons = {
          breakpoint = "🔴",
          currentpos = "󱞪 ",
        },

        verbose = false,

        -- =============================================================
        -- LSP Configuration (Handed over completely to nvim-lspconfig)
        -- =============================================================
        lsp_cfg = true,       -- Crucial: stops go.nvim from starting a 2nd gopls process
        lsp_on_attach = true, -- Bypasses the duplicated on_attach handler hook
        lsp_keymaps = false,
        lsp_codelens = true,
        lsp_document_formatting = true,

        lsp_inlay_hints = {
          enable = true,
        },


        -- =========================
        -- Coverage / Signs
        -- =========================
        gocoverage_sign = "█",
        sign_priority = 5,

        -- =========================
        -- DAP
        -- =========================
        dap_debug = true,
        dap_debug_keymap = true,
        dap_debug_gui = {},
        dap_debug_vt = {
          enabled_commands = true,
          all_frames = true,
        },

        dap_port = 38697,
        dap_timeout = 15,
        dap_retries = 20,

        -- =========================
        -- Treesitter / Testing
        -- =========================
        textobjects = true,

        test_runner = "go",
        verbose_tests = true,
        run_in_floaterm = true,

        floaterm = {
          posititon = "auto",
          width = 0.45,
          height = 0.98,
          title_colors = "catpuccino",
        },

        trouble = true,
        test_efm = false,
        luasnip = false,
      })
    end,
  },
}
