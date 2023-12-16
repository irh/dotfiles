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
        'yaml',
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
    }

    local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
    parser_config.koto = {
      install_info = {
        url = "~/dev/koto/tree-sitter-koto",
        files = { 'src/parser.c', 'src/scanner.c' },
      },
    }
  end
}
