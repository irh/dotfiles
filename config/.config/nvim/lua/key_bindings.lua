local function map(from, to)
  vim.api.nvim_set_keymap('n', from, to, {noremap = true})
end

------------------
-- Leader mappings
------------------

-- Set the leader key to Space
vim.g.mapleader = ' '

-- 1 - Write all and make
map('<leader>1', ';wa<cr><F18><cr>')

-- s - Save all
map('<leader>s', ';wa<cr>')

-- S - Vertical Split
map('<leader>S', ';vsp<cr>')

-- Reload this file when it changes
vim.cmd([[
  augroup lua_key_bindings
    autocmd!
    autocmd BufWritePost key_bindings.lua source <afile>
  augroup end
]])

