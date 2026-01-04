return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',  -- ✅ FIXED: build at TOP LEVEL
    event = { 'BufReadPre', 'BufNewFile' },
    
    -- ✅ NO config function - use opts instead
    opts = {
      -- YOUR EXACT SETTINGS PRESERVED:
      ensure_installed = { 'go', 'gowork', 'gomod', 'gosum', 'lua', 'vim', 'markdown', 'markdown_inline', 'regex', 'bash', 'json', 'sql' },
      sync_install = false,  -- ✅ Changed from true (async = faster)
      auto_install = true,
      
      highlight = { enable = true },
      indent = { enable = true },
      
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
        },
      },
      
      -- YOUR EXACT TEXTOBJECT SETTINGS PRESERVED:
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['ii'] = '@conditional.inner',
            ['ai'] = '@conditional.outer',
            ['il'] = '@loop.inner',
            ['al'] = '@loop.outer',
            ['at'] = '@comment.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = { ['<leader>a'] = '@parameter.inner' },
          swap_previous = { ['<leader>A'] = '@parameter.inner' },
        },
      },
      
      -- ✅ ADDED: Telescope error fix
      highlight = {
        enable = true,
        disable = function(lang)
          return lang:match('^Telescope') ~= nil
        end,
      },
    },
  },
}

