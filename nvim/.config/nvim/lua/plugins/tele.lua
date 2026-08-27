return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') ==
              1
        end
      },
      'nvim-tree/nvim-web-devicons',
    },

    -- 🔑 KEYMAPS BLOCK
    keys = {
      { '<C-p>',      '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'Buffers' },
    },

    opts = {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'bottom',
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

        -- 🛠️ CRITICAL LAZY-SAFE WRAPPERS (Fixes the startup crash)
        mappings = {
          i = {
            ['<C-u>'] = function(...) return require("telescope.actions").preview_scrolling_up(...) end,
            ['<C-d>'] = function(...) return require("telescope.actions").preview_scrolling_down(...) end,
            ['<C-j>'] = function(...) return require('telescope.actions').move_selection_next(...) end,
            ['<C-k>'] = function(...) return require('telescope.actions').move_selection_previous(...) end,
            ['<C-x>'] = function(...) return require('telescope.actions').select_horizontal(...) end,
            ['<C-v>'] = function(...) return require('telescope.actions').select_vertical(...) end,
            ['<C-q>'] = function(...)
              local actions = require('telescope.actions')
              return (actions.smart_send_to_qflist + actions.open_qflist)(...)
            end,
            ['<esc>'] = function(...) return require('telescope.actions').close(...) end,
          },
          n = {
            ['q'] = function(...) return require('telescope.actions').close(...) end,
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
