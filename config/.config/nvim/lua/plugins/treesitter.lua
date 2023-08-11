local M = {}

M.setup = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'c_sharp',
      'css',
      'elm',
      'fish',
      'glsl',
      'graphql',
      'haskell',
      'html',
      'javascript',
      'json',
      'json5',
      'julia',
      'lua',
      'rust',
      'sql',
      'svelte',
      'swift',
      'toml',
      'typescript',
      'vim',
      'wgsl',
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
  }
end

return M
