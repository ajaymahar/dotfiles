return {
  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      -- Keymapping for split and join
      -- gS to split
      -- gJ to join
      vim.api.nvim_set_var('splitjoin_quiet', 1)
      vim.api.nvim_set_var('splitjoin_trailing_comma', 1)
    end
  },
}
