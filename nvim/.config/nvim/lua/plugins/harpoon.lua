-- return {
--   {
--     -- harpoon
--     "ThePrimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--
--     config = function()
--       local harpoon = require("harpoon")
--
--       -- REQUIRED
--       harpoon:setup({
--         settings = {
--           save_on_toggle = true,
--           sync_on_ui_close = true,
--           key = function()
--             return vim.loop.cwd()
--           end
--         }
--       })
--       -- REQUIRED
--
--       vim.keymap.set("n", "<S-m>", function() harpoon:list():append() end)
--       vim.keymap.set("n", "<S-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
--       -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
--       -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
--       -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
--       -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--
--       -- Toggle previous & next buffers stored within Harpoon list
--       vim.keymap.set("n", "<S-p>", function() harpoon:list():prev() end)
--       vim.keymap.set("n", "<S-n>", function() harpoon:list():next() end)
--
--       -- vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", {noremap=true})
--       -- vim.api.nvim_set_keymap("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true})
--       harpoon:extend({
--         UI_CREATE = function(cx)
--           vim.keymap.set("n", "v", function() -- open selected file from harpoon menu as vsplit
--             harpoon.ui:select_menu_item({ vsplit = true })
--           end, { buffer = cx.bufnr })
--
--           vim.keymap.set("n", "s", function() -- open selected file from harpoon2 menu as split
--             harpoon.ui:select_menu_item({ split = true })
--           end, { buffer = cx.bufnr })
--
--           vim.keymap.set("n", "t", function() -- open as new tab
--             harpoon.ui:select_menu_item({ tabedit = true })
--           end, { buffer = cx.bufnr })
--         end,
--       })
--     end,
--   },
-- }
--
return {
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
