return {
  {
    -- 🛠️ NATIVE REPLACEMENT FOR FTERM.NVIM
    "native-terminal",
    virtual = true,

    config = function()
      ------------------------------------------------------------------
      -- Centralized Floating Window Creator Engine
      ------------------------------------------------------------------
      local function create_floating_terminal(cmd, buftype_name)
        local state = { win = nil, buf = nil }

        return {
          toggle = function()
            -- If window exists and is valid, close it
            if state.win and vim.api.nvim_win_is_valid(state.win) then
              vim.api.nvim_win_close(state.win, true)
              state.win = nil
              return
            end

            -- Ensure buffer is valid, or create a brand new one
            if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
              state.buf = vim.api.nvim_create_buf(false, true)
              vim.bo[state.buf].filetype = buftype_name
            end

            local columns = vim.o.columns
            local lines = vim.o.lines

            -- Set the scaling values (0.85 wide, 0.80 tall relative to text area)
            local width = math.floor(columns * 0.85)
            local height = math.floor(lines * 0.80)

            -- Calculate perfectly centered placement indices
            local row = math.floor((lines - height) / 2)
            local col = math.floor((columns - width) / 2)

            -- Spawn the native floating container window
            state.win = vim.api.nvim_open_win(state.buf, true, {
              relative = "editor",
              width = width,
              height = height,
              row = row,
              col = col,
              style = "minimal",
              border = "rounded", -- Clean modern rounded border outlines
            })

            -- If terminal execution environment hasn't started inside this buffer, start it
            if vim.bo[state.buf].buftype ~= "terminal" then
              vim.fn.termopen(cmd or vim.o.shell)
            end

            -- Instantly push cursor focus directly into input terminal mode
            vim.cmd("startinsert")
          end,

          close = function()
            if state.win and vim.api.nvim_win_is_valid(state.win) then
              vim.api.nvim_win_close(state.win, true)
              state.win = nil
            end
          end
        }
      end

      ------------------------------------------------------------------
      -- Initialize your instances
      ------------------------------------------------------------------
      local base_term = create_floating_terminal(nil, "fterm_base")
      local lazygit   = create_floating_terminal("lazygit", "fterm_lazygit")
      local btop      = create_floating_terminal("btop", "fterm_btop")

      ------------------------------------------------------------------
      -- Expose Native Vim Commands (Matches your old FTerm commands)
      ------------------------------------------------------------------
      vim.api.nvim_create_user_command("FTermToggle", base_term.toggle, { bang = true })
      vim.api.nvim_create_user_command("FTermClose", base_term.close, { bang = true })

      ------------------------------------------------------------------
      -- Global Keymappings
      ------------------------------------------------------------------
      local opts = { silent = true, desc = "Terminal: Toggle Float Window" }

      -- 1. Standard Interactive Terminal Hooks (<C-n>)
      vim.keymap.set("n", "<C-n>", base_term.toggle, opts)
      vim.keymap.set("t", "<C-n>", base_term.toggle, opts)

      -- 2. Git Client Layout Launcher (<Leader>lg)
      vim.keymap.set("n", "<leader>lg", lazygit.toggle, { silent = true, desc = "Git: Toggle Lazygit Native Window" })

      -- 3. System Hardware Monitor Launcher (<Leader>bt)
      vim.keymap.set("n", "<leader>bt", btop.toggle, { silent = true, desc = "System: Toggle Btop Native Window" })

      -- Allows pressing Esc double-tap inside any terminal to escape back to normal select mode!
      vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { silent = true, desc = "Terminal: Escape Normal Focus" })
    end,
  },
}
