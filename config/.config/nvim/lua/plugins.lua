local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
end

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
end)

print(vim.fn.stdpath('cache'))
