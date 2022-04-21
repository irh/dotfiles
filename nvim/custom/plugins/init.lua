return {
  --
  -- Language support
  --
  
  -- justfile highlighting
  {'NoahTheDuke/vim-just', ft = 'just'},

  -- Koto highlighting
  {'koto-lang/koto.vim', ft = 'koto'},

  -- Rust support, particularly for better cargo integration
  {'rust-lang/rust.vim', ft = 'rust'},

  -- Rust LSP support
  {'simrat39/rust-tools.nvim', ft = 'rust', 
    config = function() 
      require('rust-tools').setup {}
    end
  },

  -- -- Autoformatter support for LSP
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   after = "nvim-lspconfig",
  --   config = function()
  --      require("custom.plugins.configs.null_ls").setup()
  --   end,
  -- },
 
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
  
  -- Helper for surround.vim when using `.`
  {'tpope/vim-repeat'},

  -- Code auto-formatting
  {'sbdchd/neoformat'},

  --
  -- Extensions
  --

  -- Asynchronously run shell commands, used for make
  {'skywind3000/asyncrun.vim', 
    cmd = 'AsyncRun',
    config = function() 
      vim.g.asyncrun_open = 10 -- auto open the quickfix window with height 10 
    end
  },

  -- Support for local .exrc files
  {'ii14/exrc.vim'},

  -- Leader mappings for quickly toggling the quickfix / location windows
  {'Valloric/ListToggle'},

  -- Redirect output of commands into a buffer
  {'AndrewRadev/bufferize.vim'},
}
