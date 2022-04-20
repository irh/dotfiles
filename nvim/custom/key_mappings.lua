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
-- Function keys
------------------

-- F17 - Make
nmap('<F17>', ':set makeprg=$TESTPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')
-- F18 - Test
nmap('<F18>', ':set makeprg=$MAKEPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')
-- F19 - Next error
nmap('<F19>', ':wa<CR>:cnext<CR>')
-- F20 - Previous error
nmap('<F20>', ':wa<CR>:cprev<CR>')

------------------
-- Leader mappings
------------------

-- ! - make+test
nmap('<leader>!', '<F17>')

-- 1 - make
nmap('<leader>1', '<F18>')

-- 2 - Jump to previous error
nmap('<leader>2', '<F20>')

-- 3 - Jump to next error
nmap('<leader>3', '<F19>')

-- e - Toggle explorer sidebar
nmap('<leader>e', ':NvimTreeToggle<cr>')

-- s - Save all
nmap('<leader>s', ':wa<cr>')

-- S - Vertical Split
nmap('<leader>S', ':vsp<cr>')
