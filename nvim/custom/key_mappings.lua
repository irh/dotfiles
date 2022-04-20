local map = require("core.utils").map

local function nmap(from, to)
  map('n', from, to)
end


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

-- s - Save all
nmap('<leader>s', ':wa<cr>')

-- S - Vertical Split
nmap('<leader>S', ':vsp<cr>')
