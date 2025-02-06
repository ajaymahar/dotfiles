return {
  {
    "folke/noice.nvim",
    enabled = true, -- enable this plugin (the default)
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            auto_open = {
              enabled = false,
            },
          },
        },
        status = {
          -- Statusline component for LSP progress notifications.
          lsp_progress = { event = 'lsp', kind = 'progress' },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false,        -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
        smart_move = {
          -- noice tries to move out of the way of existing floating windows.
          enabled = true, -- you can disable this behaviour here
          -- add any filetypes here, that shouldn't trigger smart move.
          excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "oil" },
        },
        routes = {
          -- Ignore the typical vim change messages.
          {
            filter = {
              event = 'msg_show',
              any = {
                { find = '%d+L, %d+B' },
                { find = '; after #%d+' },
                { find = '; before #%d+' },
                { find = '%d fewer lines' },
                { find = '%d more lines' },
              },
            },
            opts = { skip = true },
          },
          -- Don't show these in the default view.
          {
            filter = {
              event = 'lsp',
              kind = 'progress',
            },
            opts = { skip = true },
          },
        },
      })

      -- Noice keymaps
      vim.api.nvim_set_keymap("n", "<leader>l", ":NoiceDismiss<CR>", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>H", ":NoiceHistory<CR>", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>L", ":NoiceLast<CR>", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>E", ":NoiceErrors<CR>", { noremap = true })
    end,
  },
}
