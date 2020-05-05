call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'flrnprz/plastic.vim'
"Plug 'google/vim-colorscheme-primary'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'noahfrederick/vim-neovim-defaults'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/ag'
Plug 'gabesoft/vim-ags'
Plug 'scrooloose/nerdtree'
Plug 'ekalinin/dockerfile.vim'
Plug 'matze/vim-move' "Move lines
Plug 'w0rp/ale' "Shellcheck
Plug 'hashivim/vim-terraform'
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
Plug 'editorconfig/editorconfig-vim'
Plug 'zirrostig/vim-smart-swap'

" Pop Up Menu Completion
Plug 'neoclide/coc-neco'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Pop Up Menu End

call plug#end()

set formatoptions-=cro "Disable automatic comment insertion

set hidden           "needed for vim COC, less prompting to edit files???

set cmdheight=2       " Better display for messages

set  number          " Show line numbers.
set  mouse=a         " enable mouse
set  laststatus=2    " statusline always on

set autoread         "  autoread the file into buffer on focus

" Indentation
set   tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set   shiftwidth=2    " Number of spaces to use for each step of autoindent.
set   expandtab       " Use the appropriate number of spaces to insert a

" <Tab>.
set   smarttab
set   autoindent
set   backspace=2     " Backspace through whitespace

" Search
set   ignorecase      " Ignore case in search patterns.
set   smartcase       " Case sensitive if pattern contains upper case chars
set   hlsearch        " Highlight all search matches
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

:set number relativenumber

" both absolute and relative line numbers are enabled by default, which produces “hybrid” line numbers. When entering insert mode, relative line numbers are turned off, leaving absolute line numbers turned on.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


" Color Scheme
"colorscheme monokai

" Google light scheme
"syntax enable
"set t_Co=256
"set background=light
"colorscheme primary

" PaperColor Theme
"set t_Co=256   " This is may or may not needed.

"set background=light
"colorscheme PaperColor

" Tender Theme
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
"colorscheme tender
colorscheme dracula

" set lighline theme inside lightline config
let g:lightline = { 'colorscheme': 'tender' }

" set airline theme
let g:airline_theme = 'tender'

" Tender theme

"Key Mappings
let mapleader = ','
nnoremap <leader>src :source $MYVIMRC<CR>
noremap <leader>w :w<cr>

" Trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Copy current file name
nmap <leader>fp :let @*=expand("%")<CR>

" Remove serach highlighting
nnoremap <esc> :noh<return><esc>

" go backward and forward through our command history with filtering
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>

" Tab navigation
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

" Move cursor between windows
noremap <leader>l <C-wl>
noremap <leader>h <C-wr>

" Navigate between buffers
noremap <Leader>b :Buffers<CR>
" Map jj and kk to escape and move in insert mode
inoremap jj <ESC>
inoremap kk <ESC>
inoremap hh <ESC>

" FZF remap
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
nnoremap <C-p> :<C-u>FZF<CR>

" Open Ag search
noremap <Leader>f :Ag<CR>

" Search lines in a files
noremap <Leader>l :Lines<CR>

" Searches the word under the cursor through the project tree using fzf and Ag
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1
" Terraform End

" Exit terminal mode
if has('nvim')
  tnoremap <C-v> <Esc> <Esc>
endif

" NERDtree
let g:NERDTreeMouseMode = 3
let NERDTreeShowHidden=1

" Find current active buffer in file tree
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>


" CoC settings
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" <TAB> maps to next completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
" <S-TAB> maps to previous completion
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" CoC settings

" Ale settings
let g:ale_linters = {'javascript': ['eslint']}
" Ale settings
"

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
