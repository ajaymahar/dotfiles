return {
  {
    'kristijanhusak/vim-dadbod-completion',
    ft = { 'sql', 'mysql', 'plsql' },
    lazy = true,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      'nvim-lua/plenary.nvim', -- Explicitly declared to ensure paths don't crash
    },

    -- Triggers UI to load on explicit database commands
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },

    config = function()
      -- Automatically establish the storage directory folder paths safely
      local ok, plenary_path = pcall(require, "plenary.path")
      local sep = ok and plenary_path.path.sep or "/"
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. sep .. "db_ui"

      -- Core configuration flags
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_tmp_query_location = '/tmp/queries'
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_execute_on_save = 0

      -- Postgres table helper execution scripts
      vim.g.db_ui_table_helpers = {
        postgresql = {
          Count = 'select count(*) from {optional_schema}{table}',
          Explain = 'EXPLAIN ANALYZE {last_query}',
        }
      }

      -- Set localized omifunc mapping scopes natively
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql" },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      })

      -- 🛠️ FIXED: Appends Dadbod directly into nvim-cmp instead of overwriting it
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.schedule(function()
            local cmp_ok, cmp = pcall(require, "cmp")
            if cmp_ok then
              cmp.setup.buffer({
                sources = cmp.config.sources({
                  { name = "vim-dadbod-completion" },
                  { name = "luasnip" },
                }, {
                  { name = "buffer" },
                }),
              })
            end
          end)
        end,
      })

      ------------------------------------------------------------------
      -- ✨ NEW KEYMAP ADDED explicitly:
      ------------------------------------------------------------------
      -- Pressing <leader>db toggles your visual SQL Client panel on the left side
      vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", {
        silent = true,
        desc = "Database: Toggle Dadbod Explorer Sidebar"
      })
    end,
  },
}
