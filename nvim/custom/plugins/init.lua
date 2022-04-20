return {
  --
  -- Language support
  --
  
  -- justfile highlighting
  {'NoahTheDuke/vim-just', ft = 'just'},

  -- Koto highlighting
  {'koto-lang/koto.vim', ft = 'koto'},

  -- Rust LSP support
  {'simrat39/rust-tools.nvim', ft = 'rust', 
    config = function() 
      require('rust-tools').setup {

      }
    end
  },
 
  --
  -- Text editing 
  --
 
  -- Surround motion
  {'tpope/vim-surround'},

  -- Auto-insert close brackets, quotes, etc
  {'jiangmiao/auto-pairs'},

  -- Provides a text object that operates on indentation level
  {'michaeljsmith/vim-indent-object'},

  -- Provides various useful text objects (pairs, strings, separators, arguments)
  {'wellle/targets.vim'},

  -- Comment out lines with gcc, uncomment with gc
  {'tpope/vim-commentary'},

  -- Helper for surround.vim when using `.`
  {'tpope/vim-repeat'},

  -- Code auto-formatting
  {'sbdchd/neoformat'},

  --
  -- Extensions
  --

  -- Asynchronously run shell commands, used for make
  {'skywind3000/asyncrun.vim', ft = 'rust'},

  -- Support for local .exrc files
  {'ii14/exrc.vim'}
}
