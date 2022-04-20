local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspconfig.rust_analyzer.setup{}

   -- lspservers with default config
   -- local servers = { "rust_analyzer" }

   -- for _, lsp in ipairs(servers) do
   --    lspconfig[lsp].setup {
   --       on_attach = attach,
   --       capabilities = capabilities,
   --       flags = {
   --          debounce_text_changes = 150,
   --       },
   --    }
   -- end
end

return M
