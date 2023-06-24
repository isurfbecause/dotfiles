-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter


local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- For more languages see:
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
nvim_treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'bash',
    'hcl',
    'javascript',
    'json',
    'lua',
    'python',
    'regex',
    'terraform',
    'vim',
    'yaml',
    --'css',
    --'html',
    --'typescript',
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}