return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'leoluz/nvim-dap-go',
      'nvim-neotest/nvim-nio',  -- Required for dap-ui
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup dap-go
      require('dap-go').setup()

      -- Modern dap-ui setup (Neovim 0.10+)
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 0.25,
            position = "bottom",
          },
        },
      })

      -- Auto-open/close dap-ui (modern event system)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Clean keymaps with descriptions
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
      vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
      
      -- Step debugging
      vim.keymap.set("n", "<leader>ds", dap.session, { desc = "Get Session" })
      vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        clear_on_continue = true,  -- Modern default
        display_callback = function(variable, _, _, _, options)
          if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value
          else
            return variable.name .. ' = ' .. variable.value
          end
        end,
        virt_text_pos = 'inline',  -- Modern default (Neovim 0.10+)
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil,
      })

      -- Modern sign definitions (Neovim 0.11+)
      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "🔴", texthl = "DiagnosticError", linehl = nil, numhl = nil })
      sign("DapBreakpointCondition", { text = "🟡", texthl = "DiagnosticWarn", linehl = nil, numhl = nil })
      sign("DapLogPoint", { text = "🔵", texthl = "DiagnosticInfo", linehl = nil, numhl = nil })
      sign("DapStopped", { text = "➡️", texthl = "DiagnosticOk", linehl = nil, numhl = nil })
    end,
  },
}

