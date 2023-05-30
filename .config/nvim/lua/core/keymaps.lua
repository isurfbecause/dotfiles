-- Change leader to a comma
vim.g.mapleader = ','

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal Mode
--

-- Write
map('n', '<leader>w', ':w<CR>')

-- Quit
map('n', '<leader>q', ':q<CR>')

-- Reload nvim config
map('n', '<leader>src', ':source $VIMCONFIG<CR>')

-- Move up/down wrapped text
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Go to file even ir it doesn't exist
map('n', 'gf', ':edit <cfile><CR>')

-- Copy current file path
map('n', '<leader>fp', ':let @+ = expand(\'%:~\')<CR>')

-- Remove serach highlighting
map('n', '<esc>', ':noh<return><esc>')

-- Tab navigation
map('n', 'tl', ':tabnext<CR>')
map('n','th', ':tabprev<CR>')
map('n', 'tn', ':tabnew<CR>')

-- Split windows
map('n', '<leader>vs', ':vsp<cr>')
map('n', '<leader>hs', ':split<cr>')

-- Resize vertical splits. Mapping doesn't matter since I use tmux bindings to trigger them
map('n', '<Leader>0', ':vertical resize -5<CR>')
map('n', '<Leader>9', ':vertical resize +5<CR>')
map('n', '<Leader>8', ':horizontal resize +5<CR>')
map('n', '<Leader>7', ':horizontal resize -5<CR>')

-- Visual Mode
--

-- Remap to copy to system clipboard
map('v', '<leader>y', '"+y', {
  desc = "Copy to system clipboard"
})

