return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
      focus = true,
      follow = true,
      auto_preview = true,
      auto_fold = true,
      cycle_results = true,

      use_diagnostic_signs = true,
      multiline = true,
      indent_lines = true,

      win = {
        position = "bottom",
        size = { height = 10 },
        border = "rounded",
      },
      icons = {
        indent = {
          top = "│ ",
          middle = "├╴",
          last = "└╴",
          fold_open = " ",
          fold_closed = " ",
        },
      },
      modes = {
        cascade = {
          mode = "diagnostics",
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item)
              return item.severity == severity
            end, items)
          end,
        },
      },
    },
  },
}
