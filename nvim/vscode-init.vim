set nocompatible " disable vi compatibility

filetype plugin indent on

set history=1000 " change history to 1000

"" Directories for swap files
set nobackup
set noswapfile

if (has('nvim'))
  " show results of substition as they're happening
  " but don't open a split
  set inccommand=nosplit
endif

" Allow backspace to work on all characters (not just insert mode)
set backspace=indent,eol,start

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" mouse support
set mouse=a

" Searching
set ignorecase
set smartcase
set magic             " Set magic on, for regex
set hlsearch          " highlight search results
set incsearch         " set incremental search, like modern browsers

" Don’t break lines
set textwidth=0
set nowrap
set number            " show line numbers
set autoindent        " automatically set indent of new line
set hidden            " current buffer can be put into background
set scrolloff=5       " lines of text around cursor
set showmatch         " show matching braces

" Tab control
set expandtab         " convert tabs to spaces
set smarttab          " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4         " the visible width of tabs
set softtabstop=4     " edit as if the tabs are 4 characters wide
set shiftwidth=4      " number of spaces to use for indent and unindent
set shiftround        " round indent to a multiple of 'shiftwidth'

" Highlight line with cursor
set cursorline

" Don’t syntax highlight lines longer than 300 characters
set synmaxcol=300

let g:netrw_banner = 0

" General Mappings {{{
" set a map leader for more key combos
let mapleader = ','

" Map : to ; (to avoid using SHIFT)
nnoremap ; :

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Indentation in VISUAL Mode like in INSERT Mode
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"" Split open buffer
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

" Quickly open/reload vim
nnoremap <leader>ev :e! ~/.config/nvim/init.vim<CR>
nnoremap <leader>er :source ~/.config/nvim/init.vim<CR>

""" Keep the window centered
noremap G Gzzzv
noremap n nzzzv
noremap N Nzzzv
noremap } }zzzv
noremap { {zzzv

""" Colors
syntax on
