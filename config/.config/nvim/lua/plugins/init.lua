local file_events = { 'BufRead', 'BufNewFile' }

local plugins = {
  --
  -- Language support
  --

  -- Common LSP configurations
  { 'neovim/nvim-lspconfig',
    event = 'VimEnter',
    config = function()
      require('plugins/lspconfig').setup()
    end
  },

  -- justfile highlighting
  { 'NoahTheDuke/vim-just', ft = 'just' },

  -- Koto highlighting
  { 'koto-lang/koto.vim', ft = 'koto' },

  -- Rust support, particularly for better cargo integration
  { 'rust-lang/rust.vim', ft = 'rust' },

  -- Rust LSP support
  { 'simrat39/rust-tools.nvim', ft = 'rust',
    config = function()
      require('rust-tools').setup {}
    end
  },

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

  --
  -- Colour scheme
  --
  { 'navarasu/onedark.nvim',
    config = function()
      onedark = require('onedark')
      onedark.setup {
        style = 'warm',
        -- transparent = true,
      }
      onedark.load()
    end
  },

  -- {
  --   'overcache/NeoSolarized',
  --   setup = function()
  --     vim.cmd('colorscheme NeoSolarized')
  --   end
  -- },

  --
  -- Extensions
  --

  -- Startup screen
  {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end
  },

  -- File explorer
  {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- For file icons
    },
    config = function()
      require('plugins/nvimtree').setup()
    end
  },

  -- Telescope - preview / select list items
  {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    cmd = 'Telescope',
    config = function()
      require('plugins/telescope').setup()
    end,
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
  { 'Valloric/ListToggle',
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
      vim.g.slime_target = 'tmux'
      vim.g.slime_default_config = { socket_name = 'default', target_pane = '{last}' }
    end
  },

  -- Show git status in the sign column
  { 'lewis6991/gitsigns.nvim',
    event = file_events,
    config = function()
      require('gitsigns').setup()
    end
  },

  --
  -- Cmp
  --

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require('plugins/cmp').setup()
    end
  },

  -- Snippet engine
  {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
    end
  },

  -- snippets
  {
    'rafamadriz/friendly-snippets',
    after = 'LuaSnip',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },

  {
    'saadparwaiz1/cmp_luasnip',
    after = 'LuaSnip',
  },

  {
    'hrsh7th/cmp-nvim-lua',
    after = 'cmp_luasnip',
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    after = 'cmp-nvim-lua',
  },

  {
    'hrsh7th/cmp-buffer',
    after = 'cmp-nvim-lsp',
  },

  {
    'hrsh7th/cmp-path',
    after = 'cmp-buffer',
  },
}

-- Bootstrap packer if it isn't already installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print('cloning packer')
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
