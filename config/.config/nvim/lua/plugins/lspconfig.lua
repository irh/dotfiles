local M = {}

M.setup = function()
  local lspconfig = require 'lspconfig'

  -- lspservers with default config
  local servers = {
    'ccls',
    'csharp_ls',
    'html',
    'jsonls',
    'julials',
    'ltex', -- Grammar + spellchecking in Markdown
    'lua_ls',
    'marksman', -- Markdown
    'svelte',
    'taplo', -- TOML
    'tsserver',
  }

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
