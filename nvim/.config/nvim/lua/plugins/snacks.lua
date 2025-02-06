return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      animate = {
        enabled = true,
        duration = 20, -- ms per step
        easing = 'linear',
        fps = 60,
      },
      bigfile = {
        enabled = true,
        notify = true,
        size = 100 * 1024, -- 100 KB
      },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          {
            -- icon = icons.ui.Keyboard,
            title = 'Keymaps',
            section = 'keys',
            indent = 2,
            padding = 1,
          },
          {
            -- icon = icons.documents.File,
            title = 'Recent Files',
            section = 'recent_files',
            indent = 2,
            padding = 1,
          },
          {
            -- icon = icons.documents.OpenFolder,
            title = 'Projects',
            section = 'projects',
            indent = 2,
            padding = 1,
          },
          { section = 'startup' },
        },
      },
      dim = {
        enabled = true,
        scope = {
          min_size = 5,
          max_size = 20,
          siblings = true,
        },
      },
      input = {
        enabled = true,
        -- icon = icons.ui.Edit,
        icon_hl = 'SnacksInputIcon',
        icon_pos = 'left',
        prompt_pos = 'title',
        win = { style = 'input' },
        expand = true,
      },
      notifier = {
        enabled = true,
        timeout = 2000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        margin = { top = 0, right = 1, bottom = 0 },
        padding = true,
        sort = { 'level', 'added' },
        level = vim.log.levels.TRACE,
        -- icons = {
        --   debug = icons.ui.Bug,
        --   error = icons.diagnostics.Error,
        --   info = icons.diagnostics.Information,
        --   trace = icons.ui.Bookmark,
        --   warn = icons.diagnostics.Warning,
        -- },
        style = 'compact',
        top_down = true,
        date_format = '%R',
        more_format = ' ↓ %d lines ',
        refresh = 50,
      },
      statuscolumn = {
        enabled = true,
        left = { 'mark', 'sign' },
        right = { 'fold', 'git' },
        folds = {
          open = false,
          git_hl = false,
        },
        git = {
          patterns = { 'GitSign', 'MiniDiffSign' },
        },
        refresh = 50,
      },

      terminal = { enabled = false },
      words = { enabled = false },
      toggle = { enabled = false },

      bufdelete = { enabled = true },
      debug = { enabled = false },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      lazygit = { enabled = true },
      indent = { enabled = true },
      notify = { enabled = true },
      picker = { enabled = true },
      rename = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      win = { enabled = true }
    },
  }
}
