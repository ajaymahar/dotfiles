return {
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("gitsigns").setup({
        current_line_blame = false,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>ha", gs.stage_hunk)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function() gs.blame_line { full = true } end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function() gs.diffthis("~") end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end
      })

      ------------------------------------------------------------------
      -- 🛠️ NATIVE GIT LOG VIEWER (Replaces vim-flog)
      ------------------------------------------------------------------
      -- Spawns a beautifully styled native vertical split displaying your branch timeline
      vim.keymap.set("n", "<leader>gl", function()
        vim.cmd("botright vsplit | terminal git log --oneline --graph --decorate --all")
        -- Automatically close the split buffer instantly when you hit 'q'
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
      end, { silent = true, desc = "Git: Native Graph Log View" })
    end,
  },
}
