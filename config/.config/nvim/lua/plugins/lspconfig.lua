return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local lspconfig = require 'lspconfig'

    -- lspservers with default config
    local servers = {
      'ccls',
      'csharp_ls',
      'cssls',
      'html',
      'jsonls',
      'julials',
      'ltex', -- Grammar + spellchecking in Markdown
      'lua_ls',
      'marksman', -- Markdown
      -- 'rust_analyzer',
      'sourcekit', -- Swift / Objective-C
      'svelte',
      'taplo', -- TOML
      'tsserver',
      'yamlls',
    }

    local capabilities = vim.tbl_deep_extend(
      "force", vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities())

    -- See https://github.com/neovim/neovim/issues/23291
    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
      }
    end
  end
}
