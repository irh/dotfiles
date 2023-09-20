-- This can be removed once https://github.com/neovim/neovim/pull/19216 is released
vim.g.do_filetype_lua = 1

require('filetype')
require('mappings')
require('settings')
require('statusline')

require('plugins')

require('autocmds')
