function extension_plugins(use)
  -- File explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- For file icons
      },
      config = function()
        require('nvim-tree').setup {
          -- options go here
        }
      end
  }

  -- Finder / navigator
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Quick toggle the quickfix window
  use 'Valloric/ListToggle'
end

function language_plugins(use)
  use {'kchmck/vim-coffee-script', ft = 'coffeescript'}
  use {'andys8/vim-elm-syntax', ft = 'elm'}
  use {'dag/vim-fish', ft = 'fish'}
  use {'tikhomirov/vim-glsl', ft = 'glsl'}
  use {'alvan/vim-closetag', ft = 'html'}
  use {'NoahTheDuke/vim-just', ft = 'just'}
  use {'koto-lang/koto.vim', ft = 'koto'}
  use {'tbastos/vim-lua', ft = 'lua'}
  use {'rust-lang/rust.vim', ft = 'rust'}
  use {'keith/swift.vim', ft = 'swift'}
  use {'cespare/vim-toml', ft = 'toml'}
  use {'leafgarland/typescript-vim', ft = 'typescript'}
  use {'DingDean/wgsl.vim', ft = 'wgsl'}
end

function text_editing_plugins(use)
  -- Surround motion
  use 'tpope/vim-surround'

  -- Auto-insert close brackets, quotes, etc
  use 'jiangmiao/auto-pairs'

  -- Provides a text object that operates on indentation level
  use 'michaeljsmith/vim-indent-object'

  -- Provides various useful text objects (pairs, strings, separators, arguments)
  use 'wellle/targets.vim'

  -- Comment out lines with gcc, uncomment with gc
  use 'tpope/vim-commentary'

  -- Helper for surround.vim when using `.`
  use 'tpope/vim-repeat'

  -- Code auto-formatting
  use 'sbdchd/neoformat'
end

-- Bootstrap packer if it isn't already installed
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- The list of plugins to use
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  extension_plugins(use)
  language_plugins(use)
  text_editing_plugins(use)
end)

-- Recompile the packer config when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

