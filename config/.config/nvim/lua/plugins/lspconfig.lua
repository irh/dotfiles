local M = {}

M.setup = function()
  local lspconfig = require 'lspconfig'

  -- lspservers with default config
  local servers = {
    'ccls',
    'jsonls',
    'julials',
    'ltex',
    'rust_analyzer',
    'sumneko_lua',
    'taplo', -- TOML
    'tsserver',
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end
end

return M
