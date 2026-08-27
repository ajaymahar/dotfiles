return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },

    -- 🔒 KEYMAP UNCHANGED: Kept exactly your original key block
    keys = {
      { "<leader>n", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },

    opts = {
      outline_window = {
        position = "right",
        width = 25,
        relative_width = true,
        auto_close = false, -- Keeps sidebar open when jumping into a file
      },
      -- Smoothly highlights the function name in the sidebar as you scroll through your code
      symbol_folding = {
        autofold_depth = 1,
      },
      preview_window = {
        border = "rounded",
      },
    },
  },
}
