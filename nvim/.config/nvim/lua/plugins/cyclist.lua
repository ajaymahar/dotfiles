return {
  "tjdevries/cyclist.vim",
  enabled = false, -- enable this plugin (the default)
  config = function()
    -- Set up 'limited' listchars
    vim.g.cyclist_listchar_sets = vim.g.cyclist_listchar_sets or {}
    vim.g.cyclist_listchar_sets.limited = {
      eol = "↲",
      tab = "» ",
      trail = "░",
      extends = "<",
      precedes = ">",
      conceal = "┊",
      nbsp = "␣",
    }

    -- Set up 'busy' listchars
    vim.g.cyclist_listchar_sets.busy = {
      eol = "↲",
      tab = "»·",
      space = "␣",
      trail = "-",
      extends = "☛",
      precedes = "☚",
      conceal = "┊",
      nbsp = "☠",
    }
  end,
}
