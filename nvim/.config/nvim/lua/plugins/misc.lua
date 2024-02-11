return {
  {
    -- Smooth scroll
    'psliwka/vim-smoothie',
    -- -- Tagbar to show overall info
    -- 'preservim/tagbar',
    -- UndoTree
    'mbbill/undotree',
    -- Diffvim
    'sindrets/diffview.nvim',
    -- working with programming {}, (), [] auto close
    'tpope/vim-surround',
    -- make transparent
    'xiyaowong/nvim-transparent',
    -- zen mode
    'folke/zen-mode.nvim',
    -- twilight
    "folke/twilight.nvim",
  },
  {
    -- autopairs
    'windwp/nvim-autopairs',

    config = function()
      -- autopaires
      require("nvim-autopairs").setup()
      require("diffview").setup()
    end,
  },
}
