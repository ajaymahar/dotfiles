return {
  { 'nvim-telescope/telescope-symbols.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          layout_strategy = "bottom_pane",
          layout_config = {
            bottom_pane = {
              height = 25,
              preview_cutoff = 120,
              prompt_position = "bottom",
            },
            center = {
              height = 0.4,
              preview_cutoff = 40,
              prompt_position = "top",
              width = 0.5
            },
            cursor = {
              height = 0.9,
              preview_cutoff = 40,
              width = 0.8
            },
            horizontal = {
              height = 0.9,
              preview_cutoff = 120,
              prompt_position = "top",
              width = 0.8
            },
            vertical = {
              height = 0.9,
              preview_cutoff = 40,
              prompt_position = "top",
              width = 0.8
            }
          },
          dynamic_preview_title = true,
          mappings = {
            i = {
              ['<C-u>'] = require("telescope.actions").preview_scrolling_up,
              ['<C-d>'] = require("telescope.actions").preview_scrolling_down,
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
              ["<C-x>"] = require('telescope.actions').select_horizontal,
              ["<C-v>"] = require('telescope.actions').select_vertical,
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end,
  },
}
