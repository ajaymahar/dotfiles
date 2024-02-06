return {
  {
    -- for comments
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      lazy = false,
    },
    'terrortylor/nvim-comment',

    config = function()
      require('nvim_comment').setup()
      require("todo-comments").setup()
      vim.api.nvim_set_keymap("n", ",", ":CommentToggle<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "/", ":CommentToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
