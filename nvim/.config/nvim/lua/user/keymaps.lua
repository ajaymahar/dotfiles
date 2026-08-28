-- ============================================================================
-- Complete Unified Keymaps Configuration
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
map("v", "H", "^", n_opts)
map("v", "L", "$", n_opts)

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

vim.keymap.set("n", ",", "gcc", { remap = true, silent = true, desc = "Comment: Toggle current line" })
vim.keymap.set("v", ",", "gc", { remap = true, silent = true, desc = "Comment: Toggle selected block" })

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

map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown({
      winblend = 0,
      previewer = false,
    })
  )
end, { desc = "Search in buffer" })

map("n", "<C-p>", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
map("n", "<C-g>", function() require("telescope.builtin").live_grep() end, { desc = "Live grep" })
map("n", "?", function() require("telescope.builtin").help_tags() end, { desc = "Help tags" })
map("n", "<leader>sw", function() require("telescope.builtin").grep_string() end, { desc = "Search word" })
map("n", "<leader>sd", function() require("telescope.builtin").diagnostics() end, { desc = "Diagnostics" })

map("n", "<C-f>", function() require("telescope.builtin").oldfiles() end, { desc = "Recent files" })
-- map("n", "<C-b>", function() require("telescope.builtin").oldfiles() end, { desc = "Recent files" })

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

-- ============================================================================
-- Harpoon (🛠️ FIXED: Lazy-wrapped requests to resolve startup crashes)
-- ============================================================================

map("n", "<S-e>", function() require("harpoon.ui").toggle_quick_menu() end, { silent = true, desc = "Harpoon Menu" })
map("n", "<S-m>", function() require("harpoon.mark").add_file() end, { silent = true, desc = "Harpoon Pin" })
map("n", "<leader>hr", function() require("harpoon.mark").rm_file() end, { silent = true, desc = "Harpoon Remove" })
map("n", "<leader>hc", function() require("harpoon.mark").clear_all() end, { silent = true, desc = "Harpoon Clear All" })
map("n", "<S-j>", function() require("harpoon.ui").nav_next() end, { silent = true, desc = "Harpoon Next" })

-- ============================================================================
-- Trouble.nvim keymaps
-- ============================================================================

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", opts)
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", opts)
map("n", "gR", "<cmd>Trouble lsp_references toggle<cr>", opts)

-- ============================================================================
-- LSP:
-- ============================================================================
--
local cinnamon = require("cinnamon")
vim.keymap.set("n", "gd", function() cinnamon.scroll(vim.lsp.buf.definition) end)
vim.keymap.set("n", "gD", function() cinnamon.scroll(vim.lsp.buf.declaration) end)

-- Centered scrolling:
vim.keymap.set("n", "<C-U>", function() cinnamon.scroll("<C-U>zz") end)
vim.keymap.set("n", "<C-D>", function() cinnamon.scroll("<C-D>zz") end)

--
-- ============================================================================
-- Floating Terminal (🛠️ FIXED: Swapped grid metrics to robust vim.o properties)
-- ============================================================================
local term_win = nil
local term_buf = nil

local function toggle_floating_terminal()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then
    term_buf = vim.api.nvim_create_buf(false, true)
  end

  -- 🛠️ FIXED: Strict runtime editor terminal text area lines calculation
  local columns = vim.o.columns
  local lines = vim.o.lines

  local width = math.floor(columns * 0.8)
  local height = math.floor(lines * 0.8)
  local row = math.floor((lines - height) / 2)
  local col = math.floor((columns - width) / 2)

  term_win = vim.api.nvim_open_win(term_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  if vim.bo[term_buf].buftype ~= "terminal" then
    vim.cmd("terminal")
  end

  vim.cmd("startinsert")
end

vim.keymap.set({ "n", "t" }, "<A-i>", toggle_floating_terminal, { desc = "Toggle Native Floating Terminal" })
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Input" })

-- ============================================================================
-- 🛠️ PURE NATIVE AUTO-EXPANDING SPLITS (Replaces windows.nvim)
-- ============================================================================
vim.o.winwidth = 85
vim.o.winminwidth = 15
vim.o.equalalways = false

local expand_group = vim.api.nvim_create_augroup("NativeWindowExpand", { clear = true })

vim.api.nvim_create_autocmd("WinEnter", {
  group = expand_group,
  callback = function()
    if vim.api.nvim_win_get_config(0).relative == "" and vim.bo.buftype == "" then
      vim.wsplit = true
    end
  end,
})
