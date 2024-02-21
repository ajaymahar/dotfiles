-- first load extension
-- require("telescope").load_extension("rest")
-- require("telescope").extensions.rest.select_env()
vim.keymap.set('n', '<C-f>', require("telescope").extensions.rest.select_env, { desc = '[S]witch [E]nv' })

local rest = require("rest-nvim")
vim.keymap.set('n', '<C-e>', rest.run, { desc = '[Make] a request' })
vim.keymap.set('n', '<C-r>', rest.last, { desc = '[Make] last request' })
--
