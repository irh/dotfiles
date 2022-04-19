-- Bootstrap packer if it isn't already installed
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Recompile the packer config when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- The list of plugins to use
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  ---- Text editing

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

  ---- UI

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
end)

print(vim.fn.stdpath('cache'))
