-- or create a vim command
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
-- or create a vim command
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
-- or create a vim command
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
-- or create a vim command
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

-- Fterm
-- vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require('FTerm').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-N>", ":FTermToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<C-N>", '<C-\\><C-n>:FTermToggle<CR>', {noremap=true})
--
-- Git
-- Open Lazygit inside nvim keymap
local fterm = require("FTerm")
local lazygit= fterm:new({
    ft = 'fterm_lazygit',
    cmd = "lazygit",
	dimensions = {
        height = 0.9,
        width = 0.9
    }
})
 -- Use this to toggle lazygit in a floating terminal
vim.keymap.set('n', '<Leader>lg', function()
    lazygit:toggle()
end)

-- Btop in FTerm
local btop = fterm:new({
    ft = 'fterm_btop',
    cmd = 'btop',
	dimensions = {
        height = 0.9,
        width = 0.9
    }
})

 -- Use this to toggle btop in a floating terminal
vim.keymap.set('n', '<Leader>bt', function()
    btop:toggle()
end)
