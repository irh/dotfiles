opt = vim.opt

-- Make backups via renaming instead of copying.
-- This is set this way so that trunk recognizes file changes in neovim, see
-- https://github.com/thedodd/trunk/issues/232
-- (May be unnecessary since https://github.com/thedodd/trunk/pull/350 was merged)
opt.backupcopy = 'no'

-- Highlight the column after 90
opt.colorcolumn = '91'

-- Ask for confirmation to save when unsaved buffers are present
opt.confirm = true

-- Options for diff mode
opt.diffopt:append('vertical')

-- Place swp files in a central folder
opt.directory:prepend('$HOME/.config/nvim/swap/')

-- Allow loading local .nvimrc files for project-specific configuration
-- opt.exrc = true

-- Don't fold by default
opt.foldenable = false

-- Use ripgrep for grepping
opt.grepprg = 'rg --vimgrep $*'

-- Allow % matching on <>
opt.matchpairs:append('<:>')

-- Don't show line numbers by default
opt.number = false

--  -- Jump to already open buffers (including tabs) when switching buffers from quickfix
--  -- switchbuf = 'useopen', -- TODO would useopen be better?
--
-- Disable word wrap by default
opt.wrap = false

-- Disable virtual text for diagnostics, it's too distracting
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable underline, use default values
   underline = true,
   -- Disable virtual text, override spacing to 4
   virtual_text = false,
 }
)
