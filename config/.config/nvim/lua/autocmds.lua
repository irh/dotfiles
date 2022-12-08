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

-- Enable inlay hints
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, args.buf)
  end,
})
