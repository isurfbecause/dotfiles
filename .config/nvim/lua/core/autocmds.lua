-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup

-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd

-- Trim whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

augroup('YankHighlight', { clear = true })
  autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})
