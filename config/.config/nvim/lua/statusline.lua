local set_active = function()
  return '%#StatusLine#'
      -- file path
      .. ' %f '
      -- separator
      .. '%='
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
  callback = function(args)
    vim.opt_local.statusline = set_active()
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  pattern = '*',
  callback = function(args)
    vim.opt_local.statusline = set_inactive()
  end,
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  pattern = 'NVimTree*',
  callback = function(args)
    vim.opt_local.statusline = ' '
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  pattern = 'NVimTree*',
  callback = function(args)
    vim.opt_local.statusline = ' '
  end,
})

-- Hide the status line in the start screen
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'AlphaReady',
  callback = function(args)
    vim.opt.laststatus = 0
  end
})

vim.api.nvim_create_autocmd({ 'BufUnload' }, {
  pattern = '*',
  callback = function(args)
    vim.opt.laststatus = 2
  end
})
