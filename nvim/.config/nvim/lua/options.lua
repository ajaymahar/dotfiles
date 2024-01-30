-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Disable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
--vim.cmd [[colorscheme onedark]]
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "nordic"

--vim.cmd()
vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Concealer for Neorg
vim.o.conceallevel=2

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Database Generate INSERT INTO Query
function _G.populate_query()
  local rows = vim.fn["db_ui#query"](string.format(
    "select column_name, data_type from information_schema.columns where table_name='%s' and table_schema='%s'",
    vim.b.dbui_table_name,
    vim.b.dbui_schema_name
  ))
  
  local lines = { 'INSERT INTO ' .. vim.b.dbui_table_name .. ' (' }
  
  for _, column_info in ipairs(rows) do
    table.insert(lines, column_info[1] .. ',')
  end
  
  table.insert(lines, ') VALUES (')
  
  for _, column_info in ipairs(rows) do
    table.insert(lines, string.format('%s <%s>,', column_info[1], column_info[2]))
  end
  
  table.insert(lines, ')')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

-- <Leader>i to generate INSERT INTO Query
vim.api.nvim_exec([[
  autocmd FileType sql nnoremap <buffer><leader>i :lua populate_query()<CR>
]], false)

-- old settings
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.wo.wrap = false -- Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- move to next line with theses keys
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term giu colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.bo.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
vim.cmd('set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*/.zip')
