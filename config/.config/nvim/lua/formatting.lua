local M = {}

function M.format()
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  if filetype == 'swift' then
    vim.cmd('Neoformat')
  else
    vim.lsp.buf.format()
  end
end

return M
