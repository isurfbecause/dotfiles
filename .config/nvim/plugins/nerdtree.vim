Plug 'scrooloose/nerdtree'
" vim-devicons for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Add colors to devicons
Plug 'ryanoasis/vim-devicons' "Add devicons in nerdtree

let g:NERDTreeMouseMode = 3
let NERDTreeShowHidden=1

" Find current active buffer in file tree
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
