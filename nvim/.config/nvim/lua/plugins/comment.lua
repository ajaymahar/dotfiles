return {
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  },
  {
    -- for comments
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      lazy = false,
    },
    config = function()
      require("todo-comments").setup()
    end,
  },
}
