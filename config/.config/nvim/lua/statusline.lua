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

local set_inactive = function()
  return '%#StatusLineNC#'
      -- file path
      .. ' %f'
end

vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
  pattern = "*",
  callback = function(args)
    vim.opt_local.statusline = set_active()
  end,
})

vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
  pattern = "*",
  callback = function(args)
    vim.opt_local.statusline = set_inactive()
  end,
})

vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
  pattern = "NvimTree*",
  callback = function(args)
    vim.opt_local.statusline = " "
  end,
})

vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
  pattern = "NvimTree*",
  callback = function(args)
    vim.opt_local.statusline = " "
  end,
})
