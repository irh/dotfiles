local map = require("core.utils").map

local function swap_keys(a, b)
  modes = {'n', 'v', 's', 'o'}
  opts = {silent = false} 
  map(modes, a, b, opts)
  map(modes, b, a, opts)
end

local function nmap(from, to)
  map('n', from, to)
end

-- Swap : and ;
swap_keys(':', ';')

------------------
-- Goto mappings
------------------

nmap('gd', ':lua vim.lsp.buf.definition()<CR>')
nmap('gD', ':lua vim.lsp.buf.declaration()<CR>')

------------------
-- Function keys
------------------

-- F17 - Make
nmap('<F17>', ':set makeprg=$MAKEPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')
-- F18 - Test
nmap('<F18>', ':set makeprg=$TESTPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')
-- F19 - Next error
nmap('<F19>', ':wa<CR>:cnext<CR>')
-- F20 - Previous error
nmap('<F20>', ':wa<CR>:cprev<CR>')

------------------
-- Leader mappings
------------------

-- ! - make+test
nmap('<leader>!', ':set makeprg=$TESTPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')

-- 1 - make
nmap('<leader>1', ':set makeprg=$MAKEPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')

-- 2 - Jump to previous error
nmap('<leader>2', ':wa<CR>:cprev<CR>')

-- 3 - Jump to next error
nmap('<leader>3', ':wa<CR>:cnext<CR>')

-- 0 - Stop an active async job
nmap('<leader>0', ':AsyncStop<CR>')

-- c - Format the current buffer
nmap('<leader>c', ':lua vim.lsp.buf.formatting_sync()<CR>')

-- d - Telescope diagnostics
nmap('<leader>d', ':Telescope diagnostics<CR>')

-- F - Telescope git files
nmap('<leader>F', ':Telescope git_files<CR>')

-- i - Telescope document symbols
nmap('<leader>i', ':Telescope lsp_document_symbols<CR>')

-- k - LSP hover
nmap('K', ':lua vim.lsp.buf.hover()<CR>')

-- o - Telescope workspace symbols
nmap('<leader>o', ':Telescope lsp_dynamic_workspace_symbols<CR>')

-- r - Telescope references
nmap('<leader>r', ':Telescope lsp_references<CR>')

-- R - LSP Rename
nmap('<leader>R', ':lua vim.lsp.buf.rename()<CR>')

-- s - Save all
nmap('<leader>s', ':wa<CR>')

-- S - Vertical Split
nmap('<leader>S', ':vsp<CR>')
