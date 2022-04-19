settings = vim.opt

-- Make backups via renaming instead of copying
-- This is set this way so that trunk recognizes file changes in neovim, see https://github.com/thedodd/trunk/issues/232
-- (May be unnecessary since https://github.com/thedodd/trunk/pull/350 was merged)
settings.backupcopy = 'no'

-- Use the system clipboard for the default register
settings.clipboard = 'unnamed'

-- Highlight the column after 90
settings.colorcolumn = '91'

-- Ask for confirmation to save when unsaved buffers are present
settings.confirm = true

-- Options for diff mode
settings.diffopt:append('vertical')

-- Place swp files in a central folder
settings.directory:prepend('$HOME/.config/nvim/swap/')

-- Don't fold by default
settings.foldenable = false

-- Use ripgrep for grepping
settings.grepprg = 'rg --vimgrep $*'

-- Allow % matching on <>
settings.matchpairs:append('<:>')

-- Enable the mouse in all modes
settings.mouse = 'a'

-- Start scrolling before the cursor reaches the vertical edge of the screen
settings.scrolloff = 2

-- Always show the sign column
settings.signcolumn = 'yes'

-- Split below the current window by default
settings.splitbelow = true

-- Jump to already open buffers (including tabs) when switching buffers from quickfix
settings.switchbuf = 'useopen' -- TODO would useopen be better?

-- Disable word wrap by default
settings.wrap = false

