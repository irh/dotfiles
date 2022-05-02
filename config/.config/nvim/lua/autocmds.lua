-- Git commit messages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt.textwidth = 80
    vim.opt.colorcolumn = '+1'
  end
})

-- Markdown settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.textwidth = 80
    vim.opt.colorcolumn = '+1'
    vim.opt.wrap = true
  end
})

-- Rust file settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt.colorcolumn = '101'
    vim.cmd "compiler cargo"
  end
})
