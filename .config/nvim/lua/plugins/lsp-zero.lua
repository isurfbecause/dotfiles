-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup

-- Create autocommand
local autocmd = vim.api.nvim_create_autocmd

local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_sources = 'recommended'
  }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'lua_ls',
  'eslint',
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    -- Invoke completion menu manually
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Enable "Super Tab"
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

    -- Use Enter to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

  },
  window = {
    -- Add borders to pop up windows
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  enabled = function()
    -- disable completion in comments
    local context = require 'cmp.config.context'
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment")
          and not context.in_syntax_group("Comment")
    end
  end,
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  }
})

-- LSP Config
local lspconfig = require 'lspconfig'

-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
    },
  },
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Terraform
lspconfig.terraformls.setup {
  capabilities = capabilities,
  filetypes = {
    "terraform",
    "tf",
    -- Comment out or will get E5248: Invalid character in group name
    -- "terraform-vars",
  },
  settings = {},
}

-- lspconfig.tflint.setup {}

-- Bashls
lsp.configure('bashls', {})

lsp.setup()