return {
  {
    'nvim-lualine/lualine.nvim',

    config = function()
      local harpoon = require("harpoon.mark")

      -- Dynamic component evaluating active Harpoon markers metrics
      local function harpoon_component()
        local total_marks = harpoon.get_length()

        if total_marks == 0 then
          return ""
        end

        local current_mark = "—"

        local mark_idx = harpoon.get_current_index()
        if mark_idx ~= nil then
          current_mark = tostring(mark_idx)
        end

        return string.format("  %s/%d", current_mark, total_marks)
      end

      -- 🛠️ FIXED: Safe runtime fallback helper for the modern v3 rest-nvim client status check
      local function rest_status_component()
        local rest_ok, rest_state = pcall(require, "rest-nvim.state")
        if not rest_ok or not rest_state.get_last_request then
          return ""
        end
        local last_req = rest_state.get_last_request()
        if not last_req then return "" end
        return " HTTP Done"
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '',
          section_separators = '',
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { harpoon_component },
          lualine_b = {
            'branch',
            'diff',
          },
          lualine_c = {
            { 'diagnostics',
              sections = { 'error', 'warn', 'info', 'hint' },
            },
          },
          lualine_x = {
            {
              'filename',
              file_status = true,
              newfile_status = true,
              path = 1,
              shorting_target = 40,
              symbols = {
                modified = ' ',
                readonly = '',
                unnamed = '[No Name]',
                newfile = '',
              }
            }
          },
          -- 🛠️ FIXED: Swapped static old rest component hook string to safe dynamic helper function
          lualine_y = {
            {
              rest_status_component,
              color = { fg = "#428890" }
            }
          },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = { harpoon_component },
          lualine_b = {
            'branch',
            'diff',
          },
          lualine_c = {
            { 'diagnostics',
              sections = { 'error', 'warn', 'info', 'hint' },
            },
          },
          lualine_x = {
            {
              'filename',
              file_status = true,
              newfile_status = true,
              path = 1,
              shorting_target = 40,
              symbols = {
                modified = ' ',
                readonly = '',
                unnamed = '[No Name]',
                newfile = '',
              }
            }
          },
          -- 🛠️ FIXED: Matched inactive layout to use clean fallback logic as well
          lualine_y = {
            {
              rest_status_component,
              color = { fg = "#428890" }
            }
          },
          lualine_z = {},
        },
        extensions = { 'quickfix', 'fzf', 'lazy', 'man', 'mason', 'nvim-dap-ui', 'oil', 'trouble' }
      }

      -- Disable this since the mode will be displayed by lualine.
      vim.o.showmode = false
    end,
  },
}
