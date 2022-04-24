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

