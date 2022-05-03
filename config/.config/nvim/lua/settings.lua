opt = vim.opt

-- Use dark theme variants
opt.background = 'dark'

-- Make backups via renaming instead of copying.
-- This is set this way so that trunk recognizes file changes in neovim, see
-- https://github.com/thedodd/trunk/issues/232
-- (May be unnecessary since https://github.com/thedodd/trunk/pull/350 was merged)
opt.backupcopy = 'no'

-- Use the system clipboard with the default register
opt.clipboard = 'unnamed'

-- Highlight the column after 90
opt.colorcolumn = '91'

-- Configure the completion menu
opt.completeopt = 'menuone,noselect'

-- Ask for confirmation to save when unsaved buffers are present
opt.confirm = true

-- Options for diff mode
opt.diffopt:append('vertical')

-- Place swp files in a central folder
opt.directory:prepend('$HOME/.config/nvim/swap/')

-- Expand tab keypresses into spaces
opt.expandtab = true

-- Don't fold by default
opt.foldenable = false

-- Use ripgrep for grepping
opt.grepprg = 'rg --vimgrep $*'

-- Ignore case when searching, see also: smartcase
opt.ignorecase = true

-- Show a status line in the last window
opt.laststatus = 2

-- Break on word boundary when wrapping is on
opt.linebreak = true

-- Allow % matching on <>
opt.matchpairs:append('<:>')

-- Enable mouse everywhere
opt.mouse = 'a'

-- Don't show line numbers by default
opt.number = false

-- Start scrolling before cursor reaches last line
opt.scrolloff = 2

-- 2 spaces for auto indent
opt.shiftwidth = 2

-- Always show the sign column
opt.signcolumn = 'yes'

-- Don't ignore case when searching if the search string contains capital letters
opt.smartcase = true

-- Smart indenting when starting a new line
opt.smartindent = true

-- Split windows should appear below or to the right
opt.splitbelow = true
opt.splitright = true

-- Enables 24 bit RGB color
opt.termguicolors = true

-- Jump to already open buffers (including tabs) when switching buffers from quickfix
-- switchbuf = 'useopen', -- TODO would useopen be better?

opt.wildmode = "longest:full"

-- Disable word wrap by default
opt.wrap = false

-- Disable virtual text for diagnostics, it's too distracting
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Disable underline
   underline = true,
   -- Disable virtual text
   virtual_text = false,
 }
)
