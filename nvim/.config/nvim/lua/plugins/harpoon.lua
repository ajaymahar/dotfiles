return {
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local harpoon = require("harpoon")

      harpoon.setup({
        menu = {
          width = math.max(60, vim.api.nvim_win_get_width(0) - 10)
        },
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
          enter_on_sendcmd = false,
          tmux_autoclose_windows = false,
          excluded_filetypes = { "harpoon" },
          mark_branch = false,
          tabline = false,
          tabline_prefix = "   ",
          tabline_suffix = "   ",
        },
      })
    end
  },
}
