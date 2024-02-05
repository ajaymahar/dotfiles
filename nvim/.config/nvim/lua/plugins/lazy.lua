-- Install lazylazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true

require('lazy').setup({

  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  },

------------------------
  -- Database Access
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
  },

------------------------
  -- Smooth scroll
  'psliwka/vim-smoothie',
  --
  -- Tagbar to show overall info 
  'preservim/tagbar',

  -- UndoTree
  'mbbill/undotree',

  -- Diffvim
  'sindrets/diffview.nvim',
  --
  -- Git worktree
  'ThePrimeagen/git-worktree.nvim',
  -- Git related plugins
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  --
  -- working with programming {}, (), [] auto close
  'tpope/vim-surround',
  -- make transparent
  'xiyaowong/nvim-transparent',
  -- floating terminal
  'numToStr/FTerm.nvim',
  -- gpd, gpr previews
  'rmagatti/goto-preview',
  -- zen mode
  'folke/zen-mode.nvim',
  -- autopairs
  'windwp/nvim-autopairs',
  -- notifications
  'rcarriga/nvim-notify',
  --
  -- color theme
  { "catppuccin/nvim", as = "catppuccin" },
  'AlexvZyl/nordic.nvim',

  -- twilight
   "folke/twilight.nvim",

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- for comments
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
  },
  'terrortylor/nvim-comment',

  -- sliding windows for nvim
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

------------------------
  -- Go
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
       "ray-x/guihua.lua",
       "neovim/nvim-lspconfig",
       "nvim-treesitter/nvim-treesitter",
    },
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
 ------------------------
  -- Debuger
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap'
    }
  },
  'theHamsta/nvim-dap-virtual-text',
  'leoluz/nvim-dap-go',
------------------------

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },

------------------------
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
     -- lua snippet
     'L3MON4D3/LuaSnip',
     'saadparwaiz1/cmp_luasnip',
     'rafamadriz/friendly-snippets',
	 'onsails/lspkind.nvim', -- for icon
    },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  'nvim-telescope/telescope-symbols.nvim',
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
     'nvim-lua/plenary.nvim',
    },
  },
  -- harpoon
  {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  -- nvim file finder or file manager
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    main = "ibl",
    opts = {},
  },
})

