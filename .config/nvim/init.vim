call plug#begin('~/.config/nvim/plugged')
" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-rhubarb' "Gbrowse and :Git
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-dotenv'
"Plug 'mhinz/vim-signify'
Plug 'ervandew/ag'
Plug 'gabesoft/vim-ags'
Plug 'scrooloose/nerdtree'
Plug 'matze/vim-move' "Move lines

"Plug 'w0rp/ale' "Shellcheck
Plug 'hashivim/vim-terraform'
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'editorconfig/editorconfig-vim'
Plug 'zirrostig/vim-smart-swap'
Plug 'dracula/vim'
Plug 'mbbill/undotree' "visualizes undo history and makes it easier to browse and switch between different undo branches

"🌲 Tressitter for syntax
Plug 'haorenW1025/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/completion-treesitter'
Plug 'lewis6991/gitsigns.nvim'

source ~/.config/nvim/plugins/nerdcommenter.vim
source ~/.config/nvim/plugins/coc.vim
"source ~/.config/nvim/plugins/coc-jedi.vim
"source ~/.config/nvim/plugins/colorizer.vim

" vim-devicons for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Add colors to devicons
Plug 'ryanoasis/vim-devicons' "Add devicons in nertree
call plug#end()

colorscheme dracula

set encoding=UTF-8
set scrolloff=8 "	Minimal number of screen lines to keep above and below the cursor.
set formatoptions-=cro "Disable automatic comment insertion
set hidden           "needed for vim COC, less prompting to edit files???
set number          " Show line numbers.
set mouse=a         " enable mouse
set laststatus=3    " statusline always on
set autoread         " autoread the file into buffer on focus
" Indentation
set tabstop=2        " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2     " Number of spaces to use for each step of autoindent.
set expandtab        " Use the appropriate number of spaces to insert a

" <Tab>.
set   smarttab
set   autoindent
set   backspace=2     " Backspace through whitespace

" Search
set   ignorecase      " Ignore case in search patterns.
set   smartcase       " Case sensitive if pattern contains upper case chars
set   hlsearch        " Highlight all search matches
hi Search guibg=peru guifg=wheat

set   incsearch       " Highlight search matches while typing

" Window Splits
set   splitbelow
set   splitright      " better defaults for opening new splits!

" Copy to osx clipboard
""set clipboard+=unnamedplus

" Autocomplete menu like bash when pressing tab
set wildmode=longest,list

" Increase command history
set history=200

noremap <2-LeftMouse> *

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax enable

"Key Mappings
let mapleader = ','
nnoremap <leader>src :source $MYVIMRC<CR>
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
nnoremap j gj
nnoremap k gk
nnoremap gf :edit <cfile><CR>

" Trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Copy current file path
nmap <leader>fp :let @+ = expand('%:~')<CR>

" Remove serach highlighting
nnoremap <esc> :noh<return><esc>

" go backward and forward through our command history with filtering
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>

" Tab navigation
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>

" Move cursor between windows
noremap <leader>l <C-wl>
noremap <leader>h <C-wr>

" Navigate between buffers
noremap <Leader>b :Buffers<CR>

"Why is this here? when I do FZF I can't and hit escape this will prevent the
"gutter from closing
"tnoremap <ESC> <C-\><C-n>

" FZF remap
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
let $FZF_DEFAULT_OPTS='--reverse'
"let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = []

"
"nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :Files<CR>

" TODO: recent files, need to find a better binding that doesn't clash with
" default next
"nnoremap <C-i> :History<CR>

" Open Ag search
noremap <C-f> :Ag! <CR>

" Searches the word under the cursor through the project tree using fzf and Ag
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1
" Terraform End

" NERDtree
let g:NERDTreeMouseMode = 3
let NERDTreeShowHidden=1

" Find current active buffer in file tree
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" Find symbol of current document
nnoremap <silent> go :<C-u>CocList outline<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Ale settings
let g:ale_linters = {'javascript': ['eslint']}
" Ale settings

" Use JQ to format json
noremap <leader>jo :%!jq .<cr>
" JQ'

" Remap to copy to system clipboard
noremap <leader>y "+y<Esc>

"function! s:show_documentation()
  "if &filetype == 'vim'
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction
"nnoremap <silent> K :call <SID>show_documentation()<CR>
noremap <leader>vs :vsp<cr>
noremap <leader>hs :split<cr>

" Resize vertical splits TODO:Find better keybindings. Tough to keep pressing with planck keyboard
nnoremap <Leader>l :vertical resize +20<CR>
nnoremap <Leader>h :vertical resize -20<CR>

" Ag shortcut
nnoremap <silent> <Leader>ag :Ag<SPACE>

" Vim Fugative
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gd :Gdiff<CR>

" Quit without writing
cnoreabbrev qq :q!

" Undo
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_RelativeTimestamp = 1
let g:undotree_ShortIndictators = 1
let g:undotree_HelpLine = 0
let g:undotree_WindowLayout = 2

if has ("persistent_undo")
  set undodir=$HOME/.undodir " Make sure to initially create .undodir
  set undofile
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs` numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

EOF

" Change background color for coc Pmenu. Default color is hard to read
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#24242c gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#6272a4 gui=NONE
