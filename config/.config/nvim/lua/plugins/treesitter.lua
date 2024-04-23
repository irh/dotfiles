return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
    local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
    parser_config.koto = {
      install_info = {
        url = "~/dev/koto/tree-sitter-koto",
        files = { 'src/parser.c', 'src/scanner.c' },
      },
    }

    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'c_sharp',
        'comment',
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
        'koto',
        'lua',
        'markdown',
        'markdown_inline',
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
      },
    }
  end
}
