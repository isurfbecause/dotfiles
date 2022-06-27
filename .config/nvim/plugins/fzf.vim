Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Why is this here? when I do FZF I can't and hit escape this will prevent the
"gutter from closing
"tnoremap <ESC> <C-\><C-n>

" FZF remap
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

" --reverse - sort by alpha on top
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_preview_window = []

"
"nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :Files<CR>

" Searches the word under the cursor through the project tree using fzf and Ag
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>
noremap <Leader>d :call fzf#run({'source': 'git ls-files', 'sink': 'e'})
