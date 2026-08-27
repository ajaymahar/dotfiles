return {
  {
    'rmagatti/goto-preview',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },

    config = function()
      local ok, telescope_themes = pcall(require, "telescope.themes")
      local ref_theme = ok and telescope_themes.get_dropdown({ hide_preview = false }) or nil

      require('goto-preview').setup {
        width = 120,
        height = 15,
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },

        -- Automatically registers standard keymaps: gpd, gpi, gpr, gpt
        default_mappings = true,

        debug = false,
        opacity = nil,
        resizing_mappings = false,

        post_open_hook = function(buf, win)
          local opts = { buffer = buf, silent = true, nowait = true, desc = "Preview: Close window" }

          -- Binds 'q' to close this specific floating window instantly
          vim.keymap.set("n", "q", function() vim.api.nvim_win_close(win, true) end, opts)

          -- Binds 'Ctrl + c' to close this specific floating window instantly
          vim.keymap.set("n", "<C-c>", function() vim.api.nvim_win_close(win, true) end, opts)
        end,

        references = {
          telescope = ref_theme
        },

        focus_on_open = true,
        dismiss_on_move = false,
        force_close = true,
        bufhidden = "wipe",
        stack_floating_preview_windows = true,
        preview_window_title = { enable = true, position = "center" },
      }
    end,
  },
}
