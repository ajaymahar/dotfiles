return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries

    config = function()
      vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>", { silent = true, noremap = true })
      -- See `:help K` for why this keymap
      vim.keymap.set("n", "K", ":GoDoc<CR>", { silent = true, noremap = true })
      -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      require('go').setup({
        disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
        -- settings with {}
        go = 'go',                -- go command, can be go[default] or go1.18beta1
        goimports = 'gopls',      -- goimport command, can be gopls[default] or either goimport or golines if need to split long lines
        fillstruct = 'gopls',     -- default, can also use fillstruct
        -- gofmt = 'gofumpt', --gofmt cmd,
        -- max_line_len = 128, -- max line length in golines format, Target maximum line length for golines tag_transform = 'camelcase', -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
        tag_options = 'json=omitempty', -- sets options sent to gomodifytags, i.e., json=omitempty
        tag_transform = "camelcase",
        gotests_template = "", -- sets gotests -template parameter (check gotests for details)
        gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
        comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. 󰟓       
        icons = { breakpoint = '🔴', currentpos = '󱞪 ' }, -- setup to `false` to disable icons setup
        verbose = false, -- output loginf in messages
        lsp_cfg = true, -- true: use non-default gopls setup specified in go/lsp.lua
        -- false: do nothing
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        -- lsp_gofumpt = true,   -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = true, -- nil: use on_attach function defined in go/lsp.lua,
        --      when lsp_cfg is true
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls
        lsp_keymaps = false, -- set to false to disable gopls/lsp keymap
        lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
        -- function(bufnr)
        --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
        -- end
        lsp_document_formatting = true,
        -- set to true: use gopls to format
        -- false if you want to use other formatter tool(e.g. efm, nulls)
        lsp_inlay_hints = {
          enable = true,
          -- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
          -- inlay only avalible for 0.10.x
          style = 'inlay',
          -- Note: following setup only works for style = 'eol', you do not need to set it for 'inlay'
          -- Only show inlay hints for the current line
          only_current_line = false,
          -- Event which triggers a refersh of the inlay hints.
          -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
          -- not that this may cause higher CPU usage.
          -- This option is only respected when only_current_line and
          -- autoSetHints both are true.
          only_current_line_autocmd = "CursorHold",
          -- whether to show variable name before type hints with the inlay hints or not
          -- default: false
          show_variable_name = true,
          -- prefix for parameter hints
          parameter_hints_prefix = "󰊕 ",
          show_parameter_hints = true,
          -- prefix for all the other hints (type, chaining)
          other_hints_prefix = "=> ",
          -- whether to align to the lenght of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- whether to align to the extreme right or not
          right_align = false,
          -- padding from the right if right_align is true
          right_align_padding = 6,
          -- The color of the hints
          highlight = "Comment",
        },
        gopls_cmd = nil,          -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
        gopls_remote_auto = true, -- add -remote=auto to gopls
        gocoverage_sign = "█",
        sign_priority = 5,        -- change to a higher number to override other signs
        dap_debug = true,         -- set to false to disable dap
        dap_debug_keymap = true,  -- true: use keymap for debugger defined in go/dap.lua
        -- false: do not use keymap in go/dap.lua.  you must define your own.
        -- Windows: Use Visual Studio keymap
        dap_debug_gui = {},                                            -- bool|table put your dap-ui setup here set to false to disable
        dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

        dap_port = 38697,                                              -- can be set to a number, if set to -1 go.nvim will pick up a random port
        dap_timeout = 15,                                              --  see dap option initialize_timeout_sec = 15,
        dap_retries = 20,                                              -- see dap option max_retries
        -- build_tags = "tag1,tag2",                                      -- set default build tags
        textobjects = true,                                            -- enable default text objects through treesittter-text-objects
        test_runner = 'go',                                            -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
        verbose_tests = true,                                          -- set to add verbose flag to tests deprecated, see '-v' option
        run_in_floaterm = false,                                       -- set to true to run in a float window. :GoTermClose closes the floatterm
        -- float term recommend if you use richgo/ginkgo with terminal color

        floaterm = {                   -- position
          posititon = 'auto',          -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
          width = 0.45,                -- width of float window if not auto
          height = 0.98,               -- height of float window if not auto
          title_colors = 'catpuccino', -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
          -- can also set to a list of colors to define colors to choose from
          -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
        },
        trouble = true,   -- true: use trouble to open quickfix
        test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
        luasnip = false,  -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
      })
    end,
  },
}
--
-- return {
--   "fatih/vim-go",
--   config = function()
--     vim.cmd("GoInstallBinaries")
--     -- Set autowrite
--     vim.cmd("set autowrite")
--
--     -- Move quickfix window with ctrl + n for next error
--     -- Use Leader key + a to close the quickfix window
--     -- Use ctrl + m to jump to previous error
--     -- Use ctrl + c to run test coverage
--     vim.cmd([[nnoremap <C-k> :cprevious<CR>]])
--     vim.cmd([[nnoremap <C-j> :cnext<CR>]])
--     vim.cmd([[nnoremap <C-c> :GoCoverage<CR>]])
--     vim.cmd([[nnoremap <leader>a :cclose<CR>]])
--
--     -- Run :GoBuild or :GoTestCompile based on the go file
--     function BuildGoFiles()
--       local file = vim.fn.expand('%')
--       if file:match('^%f+_test%.go$') then
--         vim.cmd([[call go#test#Test(0, 1)]])
--       elseif file:match('^%f+%.go$') then
--         vim.cmd([[call go#cmd#Build(0)]])
--       end
--     end
--
--     vim.cmd([[autocmd FileType go nmap ,b :<C-u>lua BuildGoFiles()<CR>]])
--     vim.cmd([[autocmd FileType go nmap ,r  <Plug>(go-run)]])
--     vim.cmd([[autocmd FileType go nmap ,t  <Plug>(go-test)]])
--
--     -- Set 4 spaces for tab in golang files
--     vim.cmd([[autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4]])
--
--     -- Set various options for golang syntax highlighting
--     vim.g.go_highlight_types = 1
--     vim.g.go_highlight_fields = 1
--     vim.g.go_highlight_functions = 1
--     vim.g.go_highlight_function_calls = 1
--     vim.g.go_highlight_operators = 1
--     vim.g.go_highlight_build_constraints = 1
--
--     -- Set up golang linting and metalinter
--     vim.g.syntastic_go_checkers = { 'golangci-lint' }
--     vim.g.go_metalinter_enabled = { 'revive', 'errchec' }
--     vim.g.go_metalinter_deadline = "30s"
--     vim.g.go_list_autoclose = 1
--
--     vim.g.go_debug_windows = {
--       ['vars'] = 'leftabove 30vnew',
--       ['stack'] = 'leftabove 20new',
--       ['goroutines'] = 'botright 10new',
--       ['out'] = 'botright 5new'
--     }
--     vim.cmd([[nnoremap dp :GoDebugBreakpoint<CR>]])
--     vim.cmd([[nnoremap gs :GoDebugStart<CR>]])
--     vim.cmd([[nnoremap gk :GoDebugStepOut<CR>]])
--     vim.cmd([[nnoremap gq :GoDebugStop<CR>]])
--
--     -- Set up auto type info for golang
--     -- vim.g.go_auto_type_info = 1
--
--     -- Set up folding for golang
--     vim.g.go_fmt_experimental = 1
--
--     -- Set up SQL prettify
--     vim.cmd(
--       [[vnoremap <leader>p :s/\<update\>\\|\<select\>\\|\<from\>\\|\<where>\\|\<left join\>\\|\<inner join\>\\|\<group by\>\\|\<order by\>/\r\U&/ge<cr><esc>``]])
--   end,
-- }
