return {
  {
    -- Visualizing branching undo timelines natively tracked by Neovim
    'mbbill/undotree',
    config = function()
      ------------------------------------------------------------------
      -- 🔑 KEYMAP ADDED explicitly:
      ------------------------------------------------------------------
      -- Pressing <leader>u will toggle the visual undo history sidebar pane
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {
        silent = true,
        desc = 'UndoTree: Toggle History Graphical Pane'
      })
    end
  },

  {
    -- Advanced side-by-side git file deltas panel
    'sindrets/diffview.nvim',
    config = function()
      require("diffview").setup()
    end,
  },

  { 'tpope/vim-surround' },
  { 'xiyaowong/nvim-transparent' },
  { 'folke/zen-mode.nvim' },
  { 'folke/twilight.nvim' },

  {
    -- 🛠️ PURE LUA NATIVE AUTOPAIRS ENGINE
    "native-autopairs",
    virtual = true,
    config = function()
      local pairs_table = { ["("] = ")", ["["] = "]", ["{"] = "}", ['"'] = '"', ["'"] = "'" }

      for open, close in pairs(pairs_table) do
        vim.keymap.set("i", open, function()
          local _, col = unpack(vim.api.nvim_win_get_cursor(0))
          local line = vim.api.nvim_get_current_line()
          local next_char = line:sub(col + 1, col + 1)

          -- If the closing bracket is already right in front of us, just step over it
          if next_char == open and (open == '"' or open == "'") then
            return "<Right>"
          elseif next_char == close then
            return "<Right>"
          else
            -- Otherwise, auto-insert the closing pair and position cursor inside
            return open .. close .. "<Left>"
          end
        end, { expr = true, noremap = true, silent = true, desc = "Native Pair Closure" })
      end
    end,
  },
}
