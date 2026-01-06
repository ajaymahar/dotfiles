-- ============================================================================
-- Keymaps
-- ============================================================================

local map = vim.keymap.set

local opts = { noremap = true, silent = true }
local n_opts = { noremap = true }
local expr_opts = { expr = true, silent = true }

-- Disable space (leader helper)
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- ============================================================================
-- Editing / Core behavior
-- ============================================================================

-- Reselect pasted text
map("n", "gp", "`[v`]", n_opts)

-- Clear search highlight
map("n", "ss", "<cmd>noh<CR>", { desc = "Clear search highlight" })
map("n", "<space><space>", "<cmd>noh<CR>", { desc = "Clear search highlight" })

-- Better redo
map("n", "U", "<cmd>redo<CR>", n_opts)

-- Jump line start / end
map("n", "H", "^", n_opts)
map("n", "L", "$", n_opts)

-- ============================================================================
-- Insert mode
-- ============================================================================

-- Escape alternatives
map("i", "jj", "<ESC>", opts)
map("i", "kk", "<ESC>", opts)

-- ============================================================================
-- Visual mode
-- ============================================================================

-- Move selected block
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- ============================================================================
-- Files
-- ============================================================================

map("n", "QQ", "<cmd>q!<CR>", { noremap = false })
map("n", "WW", "<cmd>w!<CR>", { noremap = false })

-- ============================================================================
-- Window / Split management
-- ============================================================================

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
map("n", "<C-w>,", "<cmd>vertical resize -10<CR>", opts)
map("n", "<C-w>.", "<cmd>vertical resize +10<CR>", opts)

-- Swap splits
map("n", "<leader>s", "<C-w>x", { desc = "Swap splits", silent = true })

-- ============================================================================
-- Wrapped line movement
-- ============================================================================

map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)

-- ============================================================================
-- System / Utilities
-- ============================================================================

-- Open URL under cursor
map("n", "gx", ":silent !open <cWORD><CR>", opts)

-- Toggle UI helpers
map("n", "tw", "<cmd>Twilight<CR>", n_opts)
map("n", "TT", "<cmd>TransparentToggle<CR>", opts)

-- Undotree
map("n", "<space>u", "<cmd>UndotreeToggle<CR>", opts)

-- ============================================================================
-- Comments
-- ============================================================================

map("n", ",", "<cmd>CommentToggle<CR>", opts)
map("v", ",", "<cmd>CommentToggle<CR>", opts)

-- ============================================================================
-- Debug (DAP)
-- ============================================================================

map("n", "<leader>dt", "<cmd>DapUiToggle<CR>", n_opts)
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", n_opts)
map("n", "<leader>dc", "<cmd>DapContinue<CR>", n_opts)
map("n", "<leader>dr", function()
  require("dapui").open({ reset = true })
end, n_opts)

-- ============================================================================
-- Telescope / FZF
-- ============================================================================

local tele = require("telescope.builtin")

map("n", "<leader>/", function()
  tele.current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown({
      winblend = 0,
      previewer = false,
    })
  )
end, { desc = "Search in buffer" })

map("n", "<C-p>", tele.find_files, { desc = "Find files" })
map("n", "<C-f>", tele.oldfiles, { desc = "Recent files" })
map("n", "<C-g>", tele.live_grep, { desc = "Live grep" })
map("n", "?", tele.help_tags, { desc = "Help tags" })
map("n", "<leader>sw", tele.grep_string, { desc = "Search word" })
map("n", "<leader>sd", tele.diagnostics, { desc = "Diagnostics" })

-- ============================================================================
-- Oil
-- ============================================================================

map("n", "<leader>m", function()
  require("oil").toggle_float()
end, { desc = "Oil file explorer" })

-- ============================================================================
-- Find & Replace
-- ============================================================================

map("n", "<leader>r", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(cmd, true, false, true),
    "n",
    false
  )
end, { desc = "Replace word under cursor" })

-- ============================================================================
-- Formatting
-- ============================================================================

map("n", "<leader>f", "<cmd>Format<CR>", opts)

-- ============================================================================
-- Diffview
-- ============================================================================

map("n", "<C-c>", "<cmd>DiffviewClose<CR>", opts)
map("n", "<leader>fd", "<cmd>DiffviewOpen<CR>", opts)
map("n", "<leader>fh", "<cmd>DiffviewFileHistory %<CR>", opts)
map("n", "<leader>ff", "<cmd>DiffviewToggleFiles<CR>", opts)

-- ============================================================================
-- Harpoon
-- ============================================================================

local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

map("n", "<S-e>", harpoon_ui.toggle_quick_menu)
map("n", "<S-m>", harpoon_mark.add_file)
map("n", "<leader>hr", harpoon_mark.rm_file)
map("n", "<leader>hc", harpoon_mark.clear_all)
map("n", "<S-j>", harpoon_ui.nav_next)


