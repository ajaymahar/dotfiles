-- General
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.wrap = false

-- Performance
vim.opt.updatetime = 50

-- Clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mouse
vim.opt.mouse = "a"

-- Spell (disabled globally)
vim.opt.spell = false

-- Color column
vim.opt.colorcolumn = "80"

-- Cursor
vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Word handling
vim.opt.iskeyword:append("-")

-- Completion UI
vim.opt.shortmess:append("c")

-- Navigation
vim.opt.whichwrap:append("<,>,[,],h,l")

-- Ignore files
vim.opt.wildignore:append({
  "*/.git/*",
  "*/.hg/*",
  "*/.svn/*",
  "*/tmp/*",
  "*.zip",
})

-- Visual paste without overwriting clipboard
vim.keymap.set("x", "p", '"_dP', { noremap = true })
