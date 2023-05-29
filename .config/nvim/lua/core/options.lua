-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-- Time in milliseconds to wait for a key code sequence to complete.
opt.ttimeoutlen = 0

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 8

--Disable automatic comment insertion
opt.formatoptions = 'cro'

-- Show line numbers.
opt.number = true

-- enable mouse
opt.mouse = 'a'

-- statusline always on
opt.laststatus = 3

-- autoread the file into buffer on focus
opt.autoread = true

-- Indentation
-- Number of spaces that a <Tab> in the file counts for.
opt.tabstop = 2

-- Number of spaces to use for each step of autoindent.
opt.shiftwidth = 2

-- Use the appropriate number of spaces to insert a <Tab>.
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

-- Backspace through whitespace
opt.backspace = '2'

-- Search
-- Ignore case in search patterns.
opt.ignorecase = true

-- Case sensitive if pattern contains upper case chars
opt.smartcase  = true

-- Highlight all search matches
opt.hlsearch   = true

-- Highlight search matches while typing
opt.incsearch  = true

-- Splitting a window will put the new window below the current one
opt.splitbelow = true

-- Splitting a window will put the new window right of the current one
opt.splitright = true

-- Autocomplete menu like :b <TAB>
--opt.wildmenu = true
--opt.wildmode = 'longest:full,full'

-- Increase command history
opt.history = 200

-- Enable 24-bit RGB colors
opt.termguicolors = true
