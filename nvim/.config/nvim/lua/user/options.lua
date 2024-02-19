--
vim.opt.backup = false -- This is recommended by coc
--
-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Enable spell check is this wrong
vim.opt.spell = true
vim.opt.syntax = "on"
--
-- Enable incremental searching
vim.opt.wrap = false

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 200ms
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable access to System Clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
vim.opt.colorcolumn = "80"
--
-- swapfile
vim.opt.swapfile = false
--
-- Define the mapping in Lua
-- vim.api.nvim_set_keymap('x', '<leader>p', '"_dP', { noremap = true })
vim.api.nvim_set_keymap('x', 'p', '"_dP', { noremap = true })

vim.opt.guicursor = {
  "n-v-c:block",                                  -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25",                                -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20",                                   -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50",                                      -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250",        -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
-- old settings
vim.opt.hidden = true                  -- Required to keep multiple buffers open multiple buffers
vim.opt.pumheight = 10                 -- Makes popup menu smaller
vim.opt.fileencoding = "utf-8"         -- The encoding written to file
vim.opt.cmdheight = 2                  -- More space for displaying messages
vim.opt.mouse = "a"                    -- Enable your mouse
vim.opt.conceallevel = 2               -- So that I can see `` in markdown files
vim.opt.number = true                  -- set numbered lines
-- vim.opt.showtabline = 2                -- Always show tabs
vim.opt.showmode = false               -- We don't need to see things like -- INSERT -- anymore
vim.opt.writebackup = false            -- This is recommended by coc

vim.cmd [[set colorcolumn=99999]]      -- fix indentline for now
vim.cmd [[set iskeyword+=-]]           -- treat dash separated words as a word text object"
vim.cmd [[set shortmess+=c]]           -- Don't pass messages to |ins-completion-menu|.
vim.cmd [[set whichwrap+=<,>,[,],h,l]] -- move to next line with theses keys
vim.cmd [[set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*/.zip]]
