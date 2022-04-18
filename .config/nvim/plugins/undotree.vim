Plug 'mbbill/undotree' "visualizes undo history and makes it easier to browse and switch between different undo branches

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
