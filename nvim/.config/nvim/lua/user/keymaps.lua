local opts = { noremap = true, silent = true }
-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'kk', '<ESC>', opts)
--
-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', opts)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', opts)
--
-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "H", "^", { noremap = false })
-- map 'U' to redo the changes 
vim.api.nvim_set_keymap("n", "U", "<C-r>", { noremap = false })
--
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", { noremap = true })
--
-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", { noremap = true })
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")
--
---- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })
--
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- Save with CTRL + s key
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<cr>", { silent = false })
-- Quit with CTRL + c key
vim.api.nvim_set_keymap("n", "<C-c>", "<cmd>q<cr>", { silent = false })
-- Save and Quit with CTRL + q key
vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>wq<cr>", { silent = false })
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Press gx to open the link under the cursor
vim.api.nvim_set_keymap("n", "gx", ":sil !open <cWORD><cr>", { silent = true })
--
-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", { noremap = false })
--

--
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })


-- tagbar
vim.api.nvim_set_keymap('n', '<C-t>', ':TagbarToggle<CR>', opts)

-- Undotree
vim.api.nvim_set_keymap('n', '<space>u', ':UndotreeToggle<CR>', opts)

-- comment
vim.api.nvim_set_keymap("n", ",", ":CommentToggle<CR>", opts)
vim.api.nvim_set_keymap("v", "/", ":CommentToggle<CR>", opts)

-- Debugger
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })

-- fzf
local tele = require('telescope.builtin')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tele.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- vim.keymap.set('n', '<leader>sf', tele.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-p>', tele.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-f>', tele.oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader>sg', tele.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<C-g>', tele.live_grep, { desc = '[S]earch by [G]rep' })
--
vim.keymap.set('n', '?', tele.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', tele.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sb', tele.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>sm', ":Telescope harpoon marks<CR>", { desc = 'Harpoon [M]arks' })

vim.keymap.set('n', '<leader>sS', tele.git_status, { desc = '' })
vim.keymap.set("n", "<Leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  silent)
vim.keymap.set("n", "<Leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
  silent)

vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", silent)
vim.keymap.set('n', '<leader>sd', tele.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- Options through Telescope
vim.api.nvim_set_keymap("n", "<Leader><tab>", "<Cmd>lua tele.commands()<CR>",{ noremap = false })


--oil
-- Map Oil to <leader>e
vim.keymap.set("n", "<C-m>", function()
	require("oil").toggle_float()
end)
