return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':LuaCacheClear require("go.install").update_all_sync()',

    opts = {
      -- Disable default keymaps to avoid LSP conflicts
      disable_defaults = false,
      
      -- Go binaries
      go = 'go',
      goimport = 'gopls',
      fillstruct = 'gopls',
     gofmt = 'golines',
      max_line_len = 128,
      
      -- Tags
      tag_transform = "camelcase",
      tag_options = "json=omitempty",
      
      -- LSP Configuration (modern)
      lsp_cfg = true,
      lsp_keymaps = false,  -- Disable to avoid conflicts with your LSP config
      lsp_on_attach = true,
      lsp_codelens = true,
      lsp_document_formatting = false,  -- Use your LSP format
      
      -- Modern inlay hints (Neovim 0.11+)
      lsp_inlay_hints = {
        enable = true,
        style = 'inlay',  -- Requires Neovim 0.10+
        only_current_line = false,
        show_variable_name = true,
        parameter_hints_prefix = "󰊕 ",
        show_parameter_hints = true,
        other_hints_prefix = "=> ",
        max_len_align = false,
        right_align = false,
        highlight = "Comment",
      },
      
      -- DAP integration (works with your nvim-dap config)
      dap_debug = true,
      dap_debug_keymap = false,  -- Use your global DAP keymaps
      dap_debug_gui = false,     -- Use your dap-ui config
      dap_debug_vt = false,      -- Use your virtual-text config
      dap_port = 38697,
      
      -- Clean keymaps (non-conflicting)
      lsp_keymaps = false,
      
      -- Terminal
      test_runner = 'go',
      run_in_floaterm = false,
      
      trouble = true,
      textobjects = true,
      
      -- Icons
      icons = { breakpoint = '🔴', currentpos = '➤' },
      verbose = false,
    },
  },
}

