local M = {}

M.setup = function(attach, capabilities)
  local lspconfig = require 'lspconfig'

  require 'lspconfig'.rust_analyzer.setup {}

  -- lspservers with default config
  local servers = { 'julials', 'sumneko_lua' }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end
end

return M
