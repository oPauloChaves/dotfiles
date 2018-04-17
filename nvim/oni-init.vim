set nocompatible                            " disable vi compatibility

" ensure vim-plug is installed and then load it
" call functions#PlugLoad()
" call plug#begin('~/.config/nvim/plugged')
" .editorconfig support
" Plug 'editorconfig/editorconfig-vim'
" call plug#end()

" Required:
filetype plugin indent on

" General {{{
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set autoread " detect when a file is changed

set number
set smartcase

"" Directories for swap files
set nobackup
set noswapfile

" Allow backspace to work on all characters (not just insert mode)
set backspace=indent,eol,start

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
" }}}

" General Mappings {{{
" set a map leader for more key combos
let mapleader = ','

" Map : to ; (to avoid using SHIFT)
nnoremap ; :

" shortcut to save
nmap <leader>, :w<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Tab navigation
noremap <leader>w :tabnext<CR>
noremap <leader>q :tabprevious<CR>
noremap <leader>d :tabclose<CR>
noremap <leader>t :tabnew<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}

