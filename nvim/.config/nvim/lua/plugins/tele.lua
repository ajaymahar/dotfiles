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
      require('telescope').load_extension('harpoon')
      require('telescope').load_extension('git_worktree')

      vim.keymap.set("n", "<Leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
        silent)
      vim.keymap.set("n", "<Leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
        silent)

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
              ["<C-s>"] = require('telescope.actions').select_horizontal,
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end,
  },
}
