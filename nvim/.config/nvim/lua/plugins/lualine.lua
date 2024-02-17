return {
  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline

    config = function()
      local harpoon = require("harpoon.mark")

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
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- component_separators = { left = '', right = ''},
          -- section_separators = { left = '', right = ''},
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
              file_status = true,    -- Displays file status (readonly status, modified status)
              newfile_status = true, -- Display new file status (new file means no write after created)
              path = 1,              -- 0: Just the filename
              -- 1: Relative path
              -- 2: Absolute path
              -- 3: Absolute path, with tilde as the home directory
              -- 4: Filename and parent dir, with tilde as the home directory

              shorting_target = 40, -- Shortens path to leave 40 spaces in the window
              -- for other components. (terrible name, any suggestions?)
              symbols = {
                modified = ' ', -- Text to show when the file is modified.
                readonly = '', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                newfile = '', -- Text to show for newly created file before first write
              }
            }
          },
          -- lualine_y = {
          --   {
          --     function()
          --       return require('noice').api.status.lsp_progress.get_hl()
          --     end,
          --     cond = function()
          --       return package.loaded['noice'] and require('noice').api.status.lsp_progress.has()
          --     end,
          --   },
          --   {
          --     function()
          --       return require('noice').api.status.mode.get_hl()
          --     end,
          --     cond = function()
          --       return package.loaded['noice'] and require('noice').api.status.mode.has()
          --     end,
          --   },
          -- },
          -- lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = { harpoon_component },
          lualine_b = {
            -- harpoon_component,
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
              file_status = true,    -- Displays file status (readonly status, modified status)
              newfile_status = true, -- Display new file status (new file means no write after created)
              path = 1,              -- 0: Just the filename
              -- 1: Relative path
              -- 2: Absolute path
              -- 3: Absolute path, with tilde as the home directory
              -- 4: Filename and parent dir, with tilde as the home directory

              shorting_target = 40, -- Shortens path to leave 40 spaces in the window
              -- for other components. (terrible name, any suggestions?)
              symbols = {
                modified = ' ', -- Text to show when the file is modified.
                readonly = '', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                newfile = '', -- Text to show for newly created file before first write
              }
            }
          },
          -- lualine_y = {
          --   {
          --     function()
          --       return require('noice').api.status.lsp_progress.get_hl()
          --     end,
          --     cond = function()
          --       return package.loaded['noice'] and require('noice').api.status.lsp_progress.has()
          --     end,
          --   },
          --   {
          --     function()
          --       return require('noice').api.status.mode.get_hl()
          --     end,
          --     cond = function()
          --       return package.loaded['noice'] and require('noice').api.status.mode.has()
          --     end,
          --   },
          -- },
          -- lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'quickfix', 'fzf', 'lazy', 'man', 'mason', 'nvim-dap-ui', 'oil', 'symbols-outline', 'trouble' }
      }
      -- Disable this since the mode will be displayed by lualine.
      vim.o.showmode = false
    end,
  },
}
