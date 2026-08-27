return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            auto_open = {
              enabled = false,
            },
          },
        },
        status = {
          lsp_progress = { event = 'lsp', kind = 'progress' },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        smart_move = {
          enabled = true,
          excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "oil" },
        },
        routes = {
          -- 🛠️ FIXED: Added clean native Noice filter for "No information available"
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "No information available" },
              },
            },
            opts = { skip = true },
          },
          -- Typical vim change messages filter
          {
            filter = {
              event = 'msg_show',
              any = {
                { find = '%d+L, %d+B' },
                { find = '; after #%d+' },
                { find = '; before #%d+' },
                { find = '%d fewer lines' },
                { find = '%d more lines' },
              },
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = 'lsp',
              kind = 'progress',
            },
            opts = { skip = true },
          },
        },

        notify = {
          enabled = true,
          view = "notify",
          replace = true, -- Safely merges and updates duplicate alerts rather than spawning new frames
          merge = true,   -- Structurally merges sequential duplicate logs cleanly
        }
      })

      ------------------------------------------------------------------
      -- Global Keymappings (Original shortcuts untouched)
      ------------------------------------------------------------------
      vim.keymap.set("n", "<leader>l", "<cmd>NoiceDismiss<CR>", { silent = true, desc = "Noice: Dismiss notifications" })
      vim.keymap.set("n", "<leader>H", "<cmd>NoiceHistory<CR>",
        { silent = true, desc = "Noice: View notification history" })
      vim.keymap.set("n", "<leader>L", "<cmd>NoiceLast<CR>", { silent = true, desc = "Noice: View last message modal" })
      vim.keymap.set("n", "<leader>E", "<cmd>NoiceErrors<CR>", { silent = true, desc = "Noice: Show error history log" })

      -- Controlled scrolling inside long float alerts (Original shortcut untouched)
      vim.keymap.set({ "n", "i", "s" }, "<C-f>", function()
        if not require("noice.lsp").scroll(4) then
          return "<C-f>"
        end
      end, { expr = true, silent = true, desc = "Noice: Scroll forward in floating doc popup" })
    end,
  },
}
