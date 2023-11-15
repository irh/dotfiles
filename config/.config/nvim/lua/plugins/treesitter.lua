return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
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
        'wgsl_bevy',
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
    }
  end
}
