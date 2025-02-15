return {
  -- Git related plugins
  {
    'ThePrimeagen/git-worktree.nvim',
    enabled = false, -- enable this plugin (the default)
    config = function()
      require("git-worktree").setup()
      require("telescope").load_extension("git_worktree")
      -- <Enter> - switches to that worktree
      -- <c-d> - deletes that worktree
      -- <c-f> - toggles forcing of the next deletion
    end
  },
  {
    'rhysd/git-messenger.vim',
    enabled = false, -- enable this plugin (the default)
    config = function()
      -- Set g:git_messenger_floating_win_opts
      vim.g.git_messenger_floating_win_opts = { border = 'single' }
      --
      -- When this value is set to |v:true|, the cursor goes into a popup window when
      -- running |:GitMessenger| or |<Plug>(git-messenger)|.
      vim.g.git_messenger_always_into_popup = true

      -- keymapping for git-messenger
      vim.api.nvim_set_keymap("n", "gb", ":GitMessenger<CR>", { noremap = false })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      "tpope/vim-fugitive",
    },

    config = function()
      require('gitsigns').setup {
        -- signs = {
        --   add = { text = '+' },
        --   change = { text = '~' },
        --   delete = { text = '_' },
        --   topdelete = { text = '‾' },
        --   changedelete = { text = '~' },
        -- },
        current_line_blame = false,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>ha', gs.stage_hunk)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line { full = true } end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end,
  },
}
