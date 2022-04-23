-- Hide the statusline in the file tree
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "NvimTree*",
  callback = function(args)
    vim.opt_local.statusline = ' '
  end,
})

-- Git commit messages and text files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit,markdown",
  command = "set textwidth=80 | setlocal colorcolumn=81",
})

-- Rust file settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  command = "setlocal cc=101 | compiler cargo",
})
