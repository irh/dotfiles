g = vim.g
opt = vim.opt

-- Disable default markdown indentation settings
g.markdown_recommended_style = 0

-- Use dark theme variants
opt.background = 'dark'

-- Use the system clipboard with the default register
opt.clipboard = 'unnamed'

-- Highlight the column after 90
opt.colorcolumn = '91'

-- Configure the completion menu
opt.completeopt = 'menuone,noselect'

-- Allow hiding of characters, e.g. by obsidian.nvim
opt.conceallevel = 2

-- Ask for confirmation to save when unsaved buffers are present
opt.confirm = true

-- Highlight the current line's number
opt.cursorline = true
opt.cursorlineopt = 'number'

-- Options for diff mode
opt.diffopt:append('vertical')

-- Place swp files in a central folder
opt.directory:prepend('$HOME/.config/nvim/swap/')

-- Expand tab keypresses into spaces
opt.expandtab = true

-- Enable .exrc / .nvim.lua files
opt.exrc = true

-- Don't fold by default
opt.foldenable = false

-- Use treesitter for folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Use ripgrep for grepping
opt.grepprg = 'rg --vimgrep $*'

-- Ignore case when searching, see also: smartcase
opt.ignorecase = true

-- Show a status line in all windows
opt.laststatus = 2

-- Break on word boundary when wrapping is on
opt.linebreak = true

-- Allow % matching on <>
opt.matchpairs:append('<:>')

-- Enable mouse everywhere
opt.mouse = 'a'

-- Show line numbers by default
opt.number = true

-- Start scrolling before cursor reaches last line
opt.scrolloff = 2

-- 2 spaces for auto indent
opt.shiftwidth = 2

-- Don't show incomplete commands in the command line
opt.showcmd = false

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

-- Increase the frequency of updates
opt.updatetime = 1000

-- Jump to already open buffers (including tabs) when switching buffers from quickfix
-- switchbuf = 'useopen', -- TODO would useopen be better?

opt.wildmode = "longest:full"

-- Disable word wrap by default
opt.wrap = false
