require("catppuccin").setup({
integrations = {
	cmp = true,
	gitsigns = true,
	harpoon = true,
	illuminate = true,
	indent_blankline = {
		enabled = false,
		scope_color = "sapphire",
		colored_indent_levels = false,
	},
	mason = true,
	native_lsp = { enabled = true },
	notify = true,
	noice = true,
	symbols_outline = true,
	telescope = true,
	treesitter = true,
	treesitter_context = true,
	fidget = true,
	markdown = true,
	dap = true,
	dap_ui = true,
	lsp_trouble = true,
	},
})

-- vim.cmd.colorscheme("catppuccin-macchiato")
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("nordic")
