return {
  {
    'AlexvZyl/nordic.nvim',
  },
  {
    -- color theme
    "catppuccin/nvim",
    as = "catppuccin",

    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        -- term_colors = true,
        dim_inactive = {
          enabled = false,   -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        color_overrides = {
          mocha = {
            rosewater = "#efc9c2",
            flamingo = "#ebb2b2",
            pink = "#f2a7de",
            mauve = "#b889f4",
            red = "#ea7183",
            maroon = "#ea838c",
            peach = "#f39967",
            yellow = "#eaca89",
            green = "#96d382",
            teal = "#78cec1",
            sky = "#91d7e3",
            sapphire = "#68bae0",
            blue = "#9991ab",
            -- blue = "#6897BB",
            lavender = "#a0a8f6",
            text = "#b5c1f1",
            subtext1 = "#a6b0d8",
            subtext0 = "#959ec2",
            overlay2 = "#848cad",
            overlay1 = "#717997",
            overlay0 = "#63677f",
            surface2 = "#505469",
            surface1 = "#3e4255",
            surface0 = "#2c2f40",
            base = "#1a1c2a",
            mantle = "#141620",
            crust = "#0e0f16",
          },
        },
        -- highlight_overrides = {
        --   all = function(colors)
        --     return {
        --       -- LspInlayHint = { style = { "italic" } },
        --       -- -- lightspeed-style highlighting for leap
        --       -- LeapMatch = { fg = colors.text, bold = true },
        --       -- LeapLabelPrimary = { fg = colors.pink, bold = true },
        --       -- LeapLabelSecondary = { fg = colors.blue, bold = true },
        --       -- hide telescope results title
        --       -- TelescopeResultsTitle = { fg = colors.mantle },
        --       TelescopeBorder = { fg = colors.lavender },
        --     }
        --   end,
        -- },
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          illuminate = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = {
            enabled = true,
          },
          notify = true,
          noice = true,
          symbols_outline = true,
          telescope = {
            enabled = true,
          },
          treesitter = true,
          treesitter_context = true,
          fidget = true,
          markdown = true,
          dap = true,
          dap_ui = true,
          lsp_trouble = true,
          leap = true,
        },
      })

      -- vim.cmd.colorscheme("catppuccin-macchiato")
      vim.cmd.colorscheme("catppuccin") -- Mocha
      -- vim.cmd.colorscheme("nordic")
      --
    end,
  },
}
