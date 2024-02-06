return {
  {
    'terrortylor/nvim-comment',
    config = function()
      local opts = { noremap = true, silent = true }
      require('nvim_comment').setup()
      vim.api.nvim_set_keymap("n", ",", ":CommentToggle<CR>", opts)
      vim.api.nvim_set_keymap("v", "/", ":CommentToggle<CR>", opts)
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
