local set_active = function()
  return '%#StatusLine#'
      -- file path
      .. ' %f '
      -- separator
      .. '%='
      -- lsp status
      .. '%{v:lua.require("lsp_status").status()}'
      -- line:column
      .. ' %l:%c '
      -- file type
      .. ' %y '
end

local set_inactive = function()
  return '%#StatusLineNC#'
      -- file path
      .. ' %f'
end


vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  pattern = '*',
  callback = function()
    vim.opt_local.statusline = set_active()
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  pattern = '*',
  callback = function()
    vim.opt_local.statusline = set_inactive()
  end,
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  pattern = 'NVimTree*',
  callback = function()
    vim.opt_local.statusline = ' '
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  pattern = 'NVimTree*',
  callback = function()
    vim.opt_local.statusline = ' '
  end,
})

vim.api.nvim_create_autocmd({ 'BufUnload' }, {
  callback = function()
    vim.opt.laststatus = 2
  end
})

-- Hide the status line in the start screen
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'AlphaReady',
  callback = function()
    vim.opt.laststatus = 0
  end
})

vim.api.nvim_create_autocmd({ 'LspProgress' }, {
  callback = function()
    vim.api.nvim_command('redrawstatus')
  end
})

vim.api.nvim_create_autocmd({ 'DiagnosticChanged', 'CursorHold' }, {
  pattern = '*',
  callback = function()
    vim.api.nvim_command('redrawstatus')
  end
})
