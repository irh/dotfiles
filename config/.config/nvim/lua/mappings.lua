local function map(mode, keys, command, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end
  if type(mode) == "table" then
    for _, m in ipairs(mode) do
      vim.api.nvim_set_keymap(m, keys, command, options)
    end
  else
    vim.api.nvim_set_keymap(mode, keys, command, options)
  end
end

local function swap_keys(a, b)
  modes = { 'n', 'v', 's', 'o' }
  opts = { silent = false }
  map(modes, a, b, opts)
  map(modes, b, a, opts)
end

local function nmap(from, to)
  map('n', from, to)
end

-- Set leader to space
vim.g.mapleader = " "

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

-- F17 - Test
nmap('<F17>', ':set makeprg=$TESTPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')
-- F18 - Make
nmap('<F18>', ':set makeprg=$MAKEPRG<CR>:wa<CR>:AsyncRun -program=make<CR>')
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

-- a - Trigger code action
nmap('<leader>a', ':lua vim.lsp.buf.code_action()<CR>')

-- c - Format the current buffer
nmap('<leader>c', ':lua vim.lsp.buf.formatting_sync()<CR>')

-- d - Telescope diagnostics
nmap('<leader>d', ':Telescope diagnostics<CR>')

-- e - Toggle file explorer
nmap('<leader>e', ':NvimTreeToggle<CR>')

-- E - Focus file explorer
nmap('<leader>E', ':NvimTreeFocus<CR>')

-- f - Telescope git files
nmap('<leader>f', ':Telescope git_files<CR>')

-- F - Telescope files
nmap('<leader>F', ':Telescope find_files<CR>')

-- g - Telescope grep
nmap('<leader>g', ':Telescope live_grep<CR>')

-- G - Telescope git commits
nmap('<leader>G', ':Telescope git_commits<CR>')

-- h - Search Dash for word under cursor
nmap('<leader>h', ':DashWord<CR>')

-- H - Telescope help
nmap('<leader>H', ':Telescope help_tags<CR>')

-- i - Telescope document symbols
nmap('<leader>i', ':Telescope lsp_document_symbols<CR>')

-- k - LSP hover
nmap('<leader>k', ':lua vim.lsp.buf.hover()<CR>')

-- L - Toggle line numbering
nmap('<leader>L', ':set number! number?<CR>')

-- o - Telescope workspace symbols
nmap('<leader>o', ':Telescope lsp_dynamic_workspace_symbols<CR>')

-- P - Sync Packer
nmap('<leader>P', ':PackerSync<CR>')

-- r - Telescope references
nmap('<leader>r', ':Telescope lsp_references<CR>')

-- R - LSP Rename
nmap('<leader>R', ':lua vim.lsp.buf.rename()<CR>')

-- s - Save all
nmap('<leader>s', ':wa<CR>')

-- S - Vertical Split
nmap('<leader>S', ':vsp<CR>')

-- t - New tab
nmap('<leader>t', ':tabnew<CR>')

-- u - Toggle inlay hints
nmap('<leader>u', ':lua require("lsp-inlayhints").toggle()<CR>')

-- v - toggle virtual text
nmap('<leader>v', '<Plug>(toggle-lsp-diag-vtext)')

-- x - Unlink active snippet
nmap('<leader>x', ':LuaSnipUnlinkCurrent<CR>')

-- z - Zen mode
nmap('<leader>z', ':ZenMode<CR>')
