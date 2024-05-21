return {
  --
  -- Language support
  --

  -- justfile highlighting
  { 'NoahTheDuke/vim-just', ft = 'just' },

  -- Koto highlighting
  { 'koto-lang/koto.vim', ft = { 'koto' } },
  -- { '~/dev/koto/koto.vim', ft = { 'koto', 'markdown' } },

  -- Coffeescript highlighting
  { 'kchmck/vim-coffee-script', ft = { 'coffee', 'markdown' } },

  -- Auto close HTML tags using treesitter
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter' },
    event = 'InsertEnter',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },

  -- KMonad highlighting
  {
    'kmonad/kmonad-vim',
    ft = { 'kbd' },
  },

  -- RON highlighting
  {
    'ron-rs/ron.vim',
    ft = { 'ron' },
  },

  -- Rust helpers
  {
    'mrcjkb/rustaceanvim',
    ft = { 'rust' },
  },

  --
  -- Text editing
  --

  -- Surround motion
  {
    'tpope/vim-surround',
    event = 'VeryLazy',
    config = function()
      vim.g.surround_no_insert_mappings = 1
    end
  },

  -- Provides a text object that operates on indentation level
  {
    'michaeljsmith/vim-indent-object',
    event = 'VeryLazy',
  },

  -- Provides various useful text objects (pairs, strings, separators, arguments)
  {
    'wellle/targets.vim',
    event = 'VeryLazy',
  },

  -- Helper for surround.vim when using `.`
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },

  -- Code auto-formatting
  {
    'sbdchd/neoformat',
    event = 'VeryLazy',
  },

  -- Commenting
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('Comment').setup()
    end
  },

  -- Auto-insert pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  -- Show indent lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    config = function()
      require('ibl').setup {
        indent = {
          char = '┊',
        },
        scope = {
          enabled = false,
        },
      }
    end
  },

  -- Strip trailing whitespace from modified lines on save
  --
  {
    'axelf4/vim-strip-trailing-whitespace',
    -- BufEnter is needed for the plugin to work correctly when opening files directly
    event = 'BufEnter',
  },

  --
  -- Colour scheme
  --
  {
    'navarasu/onedark.nvim',
    event = 'VimEnter',
    config = function()
      border_color = { fg = '$grey', bg = '$bg0' }
      onedark = require('onedark')
      onedark.setup {
        transparent = false,
        style = 'dark',
        highlights = {
          TelescopeBorder = border_color,
          TelescopePromptBorder = border_color,
          TelescopeResultsBorder = border_color,
          TelescopePreviewBorder = border_color,
          TelescopePromptPrefix = border_color,
        },
        toggle_style_key = '<leader>Z',
      }
      onedark.load()
    end
  },

  --
  -- LSP, Snippets and completion menu
  --

  -- Cmp + LSP integration
  {
    'hrsh7th/cmp-nvim-lsp',
    event = 'VeryLazy',
  },

  -- Snippet engine
  {
    'L3MON4D3/LuaSnip',
    event = 'VeryLazy',
    dependencies = { 'neovim/nvim-lspconfig' },
  },

  -- snippets
  {
    'rafamadriz/friendly-snippets',
    event = 'VeryLazy',
    dependencies = { 'L3MON4D3/LuaSnip' },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },

  -- Add toggle functions for diagnostics / virtual text
  {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    event = 'VeryLazy',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      require('toggle_lsp_diagnostics').init {
        underline = false,
        virtual_text = false,
      }
    end
  },

  ---
  --- Extensions
  ---

  -- DAP integration for telescope
  {
    'nvim-telescope/telescope-dap.nvim',
    event = 'VeryLazy',
    after = { 'mfussenegger/nvim-dap', 'nvim-telescope/telescope.nvim', },
    config = function()
      require('telescope').load_extension('dap')
    end
  },

  -- UI / dialog improvements
  --
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },

  -- Asynchronously run shell commands, used for make
  {
    'skywind3000/asyncrun.vim',
    cmd = 'AsyncRun',
    config = function()
      vim.g.asyncrun_open = 10 -- auto open the quickfix window with height 10
    end
  },

  -- Leader mappings for quickly toggling the quickfix / location windows
  {
    'Valloric/ListToggle',
    event = 'VeryLazy',
  },

  -- Redirect output of commands into a buffer
  {
    'AndrewRadev/bufferize.vim',
    cmd = { 'Bufferize', 'BufferizeSystem', 'BufferizeTimer' },
  },

  -- REPL interaction
  {
    'jpalardy/vim-slime',
    ft = { 'julia', 'koto' },
    config = function()
      local g = vim.g
      g.slime_target = 'tmux'
      g.slime_default_config = { socket_name = 'default', target_pane = '{last}' }
      g.slime_dont_ask_default = 1
    end
  },

  -- Show git status in the sign column
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
      require('gitsigns').setup()
    end
  },

  -- Minimal editing mode
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    config = function()
      require("zen-mode").setup {
        window = {
          options = {
            colorcolumn = "",
            signcolumn = "no",
          },
        },
      }
    end
  },

  -- Git commands
  {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Git', 'GBrowse', 'GDiff' }
  },

  -- Dash support
  {
    'mrjones2014/dash.nvim',
    event = 'VeryLazy',
    cond = function()
      return vim.fn.has('macunix') == 1
    end,
    build = 'make install',
    depencendies = { 'nvim-telescope/telescope.nvim' },
    cmd = { 'Dash', 'DashWord' },
    config = function()
      require('dash').setup {
        file_type_keywords = {
          swift = { 'apple' },
        },
      }
    end
  },

  -- Document outline
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      keymaps = {
        -- Goto location on mouse click
        goto_location = { "<CR>", "<LeftRelease>" },
      },
      symbol_folding = {
        autofold_depth = 3,
      },
    },
  },

  -- Hover info in a split window
  -- {
  --   "roobert/hoversplit.nvim",
  --   config = function()
  --     require("hoversplit").setup {
  --       key_bindings = {
  --         split_remain_focused = "<leader>hs",
  --         vsplit_remain_focused = "<leader>hv",
  --         split = "<leader>hS",
  --         vsplit = "<leader>hV",
  --       },
  --     }
  --   end
  -- },

  ----- Markdown editing
  --
  -- Obsidian support
  {
    'epwalsh/obsidian.nvim',
    event = 'VeryLazy',
    version = "*",
    dependencies = { 'hrsh7th/nvim-cmp', 'nvim-lua/plenary.nvim' },
    config = function()
      require('obsidian').setup {
        dir = '~/zk',
        daily_notes = {
          folder = "log",
          alias_format = "%B %-d, %Y",
        },
        completion = {
          nvim_cmp = true,
        },
        disable_frontmatter = true,
        mappings = {},
        follow_url_func = function(url)
          vim.fn.jobstart({ "open", url })
        end,
      }
    end
  },

  -- List editing
  -- https://github.com/preservim/vim-markdown
  {
    'preservim/vim-markdown',
    ft = 'markdown',
    config = function()
      -- Indent by two when pressing `o` in a list
      vim.g.vim_markdown_new_list_item_indent = 2
      -- Don't conceal, obsidian.nvim handles concealing
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      -- Don't add any mappings
      vim.g.vim_markdown_no_default_key_mappings = 1
    end
  },

  -- Open links on enter in markdown files
  {
    "jghauser/follow-md-links.nvim",
    ft = "markdown",
  },

  -- Toggle/create checkboxes
  {
    'nfrid/markdown-togglecheck',
    dependencies = { 'nfrid/treesitter-utils' },
    ft = { 'markdown' },
  },

  -- Xcode support
  -- https://github.com/wojciech-kulik/xcodebuild.nvim
  {
    'wojciech-kulik/xcodebuild.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require("xcodebuild").setup({})
    end
  }
}
