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
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "No information available" }, -- Clean native Noice filter!
              },
            },
            opts = { skip = true },
          },
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
        }
      })

      ------------------------------------------------------------------
      -- Global Keymappings (Modernized using native vim.keymap.set)
      ------------------------------------------------------------------
      -- Your original keys untouched:
      vim.keymap.set("n", "<leader>l", "<cmd>NoiceDismiss<CR>", { silent = true, desc = "Noice: Dismiss notifications" })
      vim.keymap.set("n", "<leader>H", "<cmd>NoiceHistory<CR>",
        { silent = true, desc = "Noice: View notification history" })
      vim.keymap.set("n", "<leader>L", "<cmd>NoiceLast<CR>", { silent = true, desc = "Noice: View last message modal" })

      -- Guarded original key (Capital E for Noice, lowercase e stays native LSP)
      vim.keymap.set("n", "<leader>E", "<cmd>NoiceErrors<CR>", { silent = true, desc = "Noice: Show error history log" })
    end,
  },
}
