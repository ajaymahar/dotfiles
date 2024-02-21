return {
  "tjdevries/cyclist.vim",
  config = function()
    vim.api.nvim_exec([[
      call cyclist#add_listchar_option_set('limited', {
          \ 'eol': '↲',
          \ 'tab': '» ',
          \ 'trail': '░',
          \ 'extends': '<',
          \ 'precedes': '>',
          \ 'conceal': '┊',
          \ 'nbsp': '␣',
          \ })
      ]], false)

    vim.api.nvim_exec([[
      call cyclist#add_listchar_option_set('busy', {
         \ 'eol': '↲',
         \ 'tab': '»·',
         \ 'space': '␣',
         \ 'trail': '-',
         \ 'extends': '☛',
         \ 'precedes': '☚',
         \ 'conceal': '┊',
         \ 'nbsp': '☠',
         \ })
      ]], false)
  end
}
