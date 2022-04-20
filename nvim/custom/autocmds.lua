vim.api.nvim_create_autocmd("FileType", {
  pattern = "Rust",
  command = "setlocal cc=101 | compiler cargo",
})
