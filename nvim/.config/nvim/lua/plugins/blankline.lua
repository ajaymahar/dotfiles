return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true, -- enable this plugin (the default)
    event = "BufEnter",
    main = "ibl",
    opts = {},

    config = function()
      require("ibl").setup({
        scope = {
          enabled = false,
          show_start = false,
          show_end = false,
        },
      })
    end,
  },
}
