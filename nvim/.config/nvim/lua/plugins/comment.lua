return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = { "BufReadPost", "BufNewFile" },

    config = function()
      require("todo-comments").setup({
        signs = true,
      })

      --
      ------------------------------------------------------------------
      -- Keymaps for navigating TODO blocks
      ------------------------------------------------------------------
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { silent = true, desc = "Todo: Jump forward to next todo marker" })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { silent = true, desc = "Todo: Jump backward to previous todo marker" })
    end,
  },
}
