set history=1000 " change history to 1000

" show results of substition as they're happening
" but don't open a split
set inccommand=nosplit

" Allow backspace to work on all characters (not just insert mode)
set backspace=indent,eol,start

"" Copy/Paste/Cut
set clipboard=unnamedplus

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" Searching
set ignorecase
set smartcase
set magic             " Set magic on, for regex
set hlsearch          " highlight search results
set incsearch         " set incremental search, like modern browsers

" General Mappings {{{
" set a map leader for more key combos
let mapleader = ','

" Map : to ; (to avoid using SHIFT)
nnoremap ; :

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Split open buffer
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent> <leader>f :<C-u>call VSCodeNotify('editor.action.formatDocument')<CR>
nnoremap <silent> <leader>k :<C-u>call VSCodeNotify('workbench.view.explorer')<CR>
nnoremap <silent> <C-k> :<C-u>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
