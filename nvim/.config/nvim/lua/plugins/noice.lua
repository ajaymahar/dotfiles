require("noice").setup({
    -- add any options here
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
		 relative = "editor",
		 position = {
		   row = 8,
		   col = "50%",
		 },
		 size = {
		   width = 60,
		   height = "auto",
		 },
		 border = {
		   style = "rounded",
		   padding = { 0, 1 },
		 },
		 win_options = {
		   winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
		 },
	  },
    },
	cmdline = {
		 enabled = true, -- enables the Noice cmdline UI
		 view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
		 opts = {}, -- global options for the cmdline. See section on views
		 -- @type table<string, CmdlineFormat>
		 format = {
			 -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
			 -- view: (default is cmdline view)
			 -- opts: any options passed to the view
			 -- icon_hl_group: optional hl_group for the icon
			 -- title: set to anything or empty string to hide
			 cmdline = { pattern = "^:", icon = "", lang = "vim" },
			 search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			 search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			 filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			 lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			 help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
			 input = {}, -- Used by input()
			 -- lua = false, -- to disable a format, set to `false`
		},
    },
    -- you can enable a preset for easier configuration
    presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    smart_move = {
		-- noice tries to move out of the way of existing floating windows.
		enabled = true, -- you can disable this behaviour here
		-- add any filetypes here, that shouldn't trigger smart move.
		excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
    },
})

