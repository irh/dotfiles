local file_events = { 'BufRead', 'BufNewFile' }

local plugins = {
  --
  -- Language support
  --

  -- justfile highlighting
  { 'NoahTheDuke/vim-just', ft = 'just' },

  -- Koto highlighting
  -- { 'koto-lang/koto.vim', ft = {'koto', 'markdown'} },
  { '~/dev/koto/koto.vim', ft = { 'koto', 'markdown' } },

  -- Coffeescript highlighting
  { 'kchmck/vim-coffee-script', ft = { 'coffee', 'markdown' } },

  -- Markdown support
  { 'preservim/vim-markdown',
    ft = 'markdown',
    setup = function()
      local g = vim.g
      g.vim_markdown_auto_insert_bullets = 0
      g.vim_markdown_new_list_item_indent = 0
    end
  },

  -- Markdown editing QoL
  { 'SidOfc/mkdx',
    ft = 'markdown',
    config = function()
      vim.g['mkdx#settings'] = {
        enter = {
          -- Enable shift+enter in multiline list items
          -- Requires overridden shift+enter codes in alacritty.yml
          shift = 1,
          -- Add list/check items when entering insert mode with o
          o = 1,
          -- Add list/check items when entering insert mode with shift+o
          shifto = 1,
        },
        -- Update list numbers with ctrl+t/d
        insert_indent_mappings = 1,
      }
    end
  },


  -- Rust support, particularly for better cargo integration
  { 'rust-lang/rust.vim', ft = 'rust' },

  -- Pug syntax highlighting
  { 'digitaltoad/vim-pug', ft = 'pug' },

  { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins/treesitter').setup()
    end,
    event = file_events,
    run = ':TSUpdate',
  },

  --
  -- Text editing
  --

  -- Surround motion
  { 'tpope/vim-surround',
    event = file_events,
  },

  -- Provides a text object that operates on indentation level
  { 'michaeljsmith/vim-indent-object',
    event = file_events,
  },

  -- Provides various useful text objects (pairs, strings, separators, arguments)
  { 'wellle/targets.vim',
    event = file_events,
  },

  -- Helper for surround.vim when using `.`
  { 'tpope/vim-repeat',
    event = file_events,
  },

  -- Code auto-formatting
  { 'sbdchd/neoformat',
    event = file_events,
  },

  -- Commenting
  {
    'numToStr/Comment.nvim',
    event = file_events,
    keys = { 'gcc' },
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
    config = function()
      require('indent_blankline').setup {
        -- show_first_indent_level = false,
        show_trailing_blankline_indent = false,
      }
    end
  },

  -- Strip trailing whitespace from modified lines on save
  --
  { 'axelf4/vim-strip-trailing-whitespace',
    -- Needs to be loaded before VimEnter so that it's active before the initial buffer
    -- is loaded
    -- event = { '' },
  },

  --
  -- Colour scheme
  --
  { 'navarasu/onedark.nvim',
    config = function()
      border_color = { fg = '$grey', bg = '$bg0' }
      onedark = require('onedark')
      onedark.setup {
        transparent = false,
        style = 'dark',
        highlights = {
          IndentBlanklineChar = { fg = '#383838' },
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
  { 'hrsh7th/cmp-nvim-lsp',
    event = 'BufEnter',
  },

  -- Common LSP configurations
  { 'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    config = function()
      require('plugins/lspconfig').setup()
    end
  },

  -- Snippet engine
  { 'L3MON4D3/LuaSnip',
    after = 'nvim-lspconfig',
  },

  -- snippets
  { 'rafamadriz/friendly-snippets',
    after = 'LuaSnip',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },

  -- Completion menu
  { 'hrsh7th/nvim-cmp',
    after = 'LuaSnip',
    config = function()
      require('plugins/cmp').setup()
    end
  },

  -- Cmp + LuaSnip integration
  { 'saadparwaiz1/cmp_luasnip',
    after = 'nvim-cmp',
  },

  -- cmp sources

  { 'hrsh7th/cmp-nvim-lua',
    after = 'nvim-cmp',
  },

  { 'hrsh7th/cmp-buffer',
    after = 'nvim-cmp',
  },

  { 'hrsh7th/cmp-path',
    after = 'nvim-cmp',
  },

  { 'f3fora/cmp-spell',
    after = 'nvim-cmp',
  },

  -- Add toggle functions for diagnostics / virtual text
  { 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    after = 'cmp-nvim-lsp',
    config = function()
      require('toggle_lsp_diagnostics').init {
        underline = false,
        virtual_text = false,
      }
    end
  },

  -- Adds support for LSP inlay hints
  { 'lvimuser/lsp-inlayhints.nvim',
    after = 'cmp-nvim-lsp',
    config = function()
      require("lsp-inlayhints").setup {
        enabled_at_startup = false,
      }
    end
  },

  --
  -- Extensions
  --

  -- Startup screen
  { 'goolord/alpha-nvim',
    event = 'VimEnter',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('plugins.alpha').config)
    end
  },

  -- File explorer
  { 'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- For file icons
    },
    config = function()
      require('plugins/nvimtree').setup()
    end
  },

  -- Telescope - preview / select list items
  { 'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    event = 'VimEnter',
    config = function()
      require('plugins/telescope').setup()
    end,
  },

  -- UI / dialog improvements
  --
  { 'stevearc/dressing.nvim',
    event = 'VimEnter',
  },

  -- Asynchronously run shell commands, used for make
  { 'skywind3000/asyncrun.vim',
    cmd = 'AsyncRun',
    config = function()
      vim.g.asyncrun_open = 10 -- auto open the quickfix window with height 10
    end
  },

  -- Support for local .exrc files
  { 'ii14/exrc.vim' },

  -- Leader mappings for quickly toggling the quickfix / location windows
  {
    'Valloric/ListToggle',
    event = 'VimEnter',
  },

  -- Redirect output of commands into a buffer
  { 'AndrewRadev/bufferize.vim',
    cmd = { 'Bufferize', 'BufferizeSystem', 'BufferizeTimer' },
  },

  -- REPL interaction
  { 'jpalardy/vim-slime',
    ft = { 'julia', 'koto' },
    config = function()
      local g = vim.g
      g.slime_target = 'tmux'
      g.slime_default_config = { socket_name = 'default', target_pane = '{last}' }
      g.slime_dont_ask_default = 1
    end
  },

  -- Show git status in the sign column
  { 'lewis6991/gitsigns.nvim',
    event = file_events,
    config = function()
      require('gitsigns').setup()
    end
  },

  -- Minimal editing mode
  { 'folke/zen-mode.nvim',
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
  { 'tpope/vim-fugitive',
    cmd = { 'G', 'Git', 'GBrowse', 'GDiff' }
  },

  -- Fixed gx mapping
  { 'felipec/vim-sanegx',
    event = 'BufEnter',
  },


  -- Dash support
  {
    'mrjones2014/dash.nvim',
    opt = true,
    cond = function()
      return vim.fn.has('macunix') == 1
    end,
    run = 'make install',
    after = 'telescope.nvim',
    cmd = { 'Dash', 'DashWord' },
    config = function()
      require('dash').setup {}
    end
  },

  -- Obsidian support
  {
    'epwalsh/obsidian.nvim',
    after = 'nvim-cmp',
    config = function()
      require('obsidian').setup {
        dir = '~/zk',
        daily_notes = {
          folder = "log",
        },
        completion = {
          nvim_cmp = true,
        },
        disable_frontmatter = true,
      }
    end
  },
}

-- Bootstrap packer if it isn't already installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print('cloning packer')
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

local packer = require('packer')

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
}

packer.startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  for _, plugin in ipairs(plugins) do
    use(plugin)
  end

  if packer_bootstrap then
    require('packer').sync()
  end
end)
