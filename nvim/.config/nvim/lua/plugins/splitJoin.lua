return {
  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.api.nvim_set_var('splitjoin_quiet', 1)
      vim.api.nvim_set_var('splitjoin_trailing_comma', 1)
    end
  },
}
