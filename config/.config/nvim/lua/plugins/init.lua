-- Bootstrap packer if it isn't already installed
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Recompile the packer config when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local plugins = {
  --
  -- Language support
  --

  -- Common LSP configurations
  { 'neovim/nvim-lspconfig',
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

  -- -- Autoformatter support for LSP
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   after = "nvim-lspconfig",
  --   config = function()
  --      require("custom.plugins.configs.null_ls").setup()
  --   end,
  -- },

  --
  -- Text editing
  --

  -- Surround motion
  { 'tpope/vim-surround' },

  -- Auto-insert close brackets, quotes, etc
  -- {'jiangmiao/auto-pairs'},

  -- Provides a text object that operates on indentation level
  { 'michaeljsmith/vim-indent-object' },

  -- Provides various useful text objects (pairs, strings, separators, arguments)
  { 'wellle/targets.vim' },

  -- Helper for surround.vim when using `.`
  { 'tpope/vim-repeat' },

  -- Code auto-formatting
  { 'sbdchd/neoformat' },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    keys = { "gcc" },
    config = function()
      require('Comment').setup()
    end
  },

  -- Auto-insert pairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  --
  -- Colour scheme
  --
  { 'navarasu/onedark.nvim',
    config = function()
      onedark = require('onedark')
      onedark.setup {
        style = 'warm'
      }
      onedark.load()
    end
  },

  --
  -- Extensions
  --

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
    "nvim-telescope/telescope.nvim",
    requires = { { 'nvim-lua/plenary.nvim' } },
    cmd = "Telescope",
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
  { 'Valloric/ListToggle' },

  -- Redirect output of commands into a buffer
  { 'AndrewRadev/bufferize.vim' },

  -- REPL interaction
  { 'jpalardy/vim-slime',
    ft = { 'julia', 'koto' },
    config = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
    end
  },

  -- Show git status in the sign column
  { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
}

-- The list of plugins to use
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  for _, plugin in ipairs(plugins) do
    use(plugin)
  end
end)
