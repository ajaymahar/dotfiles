return {
  'echasnovski/mini.animate',
  version = '*',
  config = function()
    require("mini.animate").setup({
      resize = {
        enable = false,
      },
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    })
  end
}
