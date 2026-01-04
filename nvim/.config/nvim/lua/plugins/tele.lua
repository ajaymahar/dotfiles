return {
  {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable('make') == 1 },
    'nvim-tree/nvim-web-devicons',
  },
    keys = {  -- ✅ Added for Lazy.nvim lazy-loading
      -- { '<leader>ff', '<cmd>Telescope find_files<cr>',  desc = 'Find Files (FF)' },
      -- { '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'Live Grep (FG)' },
      { '<C-p>',      '<cmd>Telescope git_files<cr>',   desc = 'Git Files' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'Buffers' },
      -- { '<leader>fs', '<cmd>Telescope symbols<cr>',    desc = 'Symbols' },
    },
    opts = {  -- ✅ Modern Lazy.nvim pattern
      defaults = {
        -- ✅ Simplified, modern layout
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            width = 0.9,
            height = 0.9,
            preview_width = 0.6,
          },
        },
        file_ignore_patterns = {
          'node_modules', '.git/', '%.o', '%.a', '%.out', '%.class', '%.pdf', '%.mkv', '%.zip'
        },
        prompt_prefix = '  ',
        selection_caret = '➤ ',
        path_display = { 'smart' },
        winblend = 0,
        dynamic_preview_title = true,
        mappings = {
          i = {
            ['<C-u>'] = require("telescope.actions").preview_scrolling_up,
            ['<C-d>'] = require("telescope.actions").preview_scrolling_down,
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
            ['<C-x>'] = require('telescope.actions').select_horizontal,
            ['<C-v>'] = require('telescope.actions').select_vertical,
            ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
            ['<esc>'] = require('telescope.actions').close,
          },
          n = {
            ['q'] = require('telescope.actions').close,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        git_files = {
          show_untracked = true,
        },
        live_grep = {
          additional_args = { '--hidden', '--glob', '!.git/*' },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
        symbols = {
          sources = {
            ['latex'] = { "begin", "end" },
          },
        },
      },
    },
  },
}

