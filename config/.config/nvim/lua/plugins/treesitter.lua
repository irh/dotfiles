local M = {}

M.setup = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash',
      'c',
      'css',
      'elm',
      'fish',
      'glsl',
      'haskell',
      'html',
      'javascript',
      'json',
      'julia',
      'lua',
      'rust',
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
