-- C# settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end
})


-- Git commit messages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt.textwidth = 80
    vim.opt.colorcolumn = '+1'
  end
})

-- Koto settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "koto",
  callback = function()
    vim.opt.textwidth = 100
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
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end
})

-- Rust file settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt.textwidth = 100
    vim.opt.colorcolumn = '+1'
    vim.cmd "compiler cargo"
  end
})
