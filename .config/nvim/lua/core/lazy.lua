-- Installation of Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Init and setup
require("lazy").setup({
    {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme dracula]])
    end
  },
    {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  'christoomey/vim-tmux-navigator',
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    keys = {
      { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    }
  },

  -- LSP
  { 'neovim/nvim-lspconfig' },

  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    event = 'InsertEnter',
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  },
})
