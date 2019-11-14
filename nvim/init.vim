set nocompatible " disable vi compatibility

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'css', 'typescript', 'typescript.tsx' ]}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'wincent/ferret'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'

" https://browntreelabs.com/base-16-shell-and-why-its-so-awsome/
Plug 'chriskempson/base16-vim'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

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
set magic                            " Set magic on, for regex
set hlsearch                         " highlight search results
set incsearch                        " set incremental search, like modern browsers

" Don’t break lines
set textwidth=0
set nowrap
set number                " show line numbers
set autoindent            " automatically set indent of new line
set hidden                " current buffer can be put into background
set scrolloff=5           " lines of text around cursor
set showmatch             " show matching braces

" Tab control
set expandtab " convert tabs to spaces
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Highlight line with cursor
set cursorline

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
" partially lifted from http://stackoverflow.com/a/15583861/4921402
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*/.hg/*,*/.git/*.,*/.DS_Store,*/.idea/*,*/.tmp/*,*/target/*,*/node_modules/*

" Don’t syntax highlight lines longer than 300 characters
set synmaxcol=300

" General Mappings {{{
" set a map leader for more key combos
let mapleader = ','

let g:netrw_banner = 0

" Map : to ; (to avoid using SHIFT)
nnoremap ; :

" shortcut to save
nmap <leader>w :w<cr>

"" Buffer navigation
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>d :bd<CR>
" Quick toggle between buffers
noremap <leader>j :b#<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Indentation in VISUAL Mode like in INSERT Mode
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

""" Remove unwanted whitespace when saving
" autocmd BufWritePre * silent! %s/\s\+$//e

""" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

""" NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>
let NERDTreeShowHidden=1

""" vim-fugitive
nmap <silent><leader>gs :Gstatus<cr>
nmap <silent><leader>gb :Gblame<cr>

""" JSON
let g:vim_json_syntax_conceal = 0

""" emmet
let g:user_emmet_settings = {
\  'javascript.jsx': {
\    'extends': 'jsx',
\  },
\  'typescript.tsx' : {
\    'extends' : 'jsx',
\  },
\}

""" FZF
let g:fzf_layout = { 'down': '~25%' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

if isdirectory(".git")
  nmap <silent> <leader>f :GFiles --cached --others --exclude-standard<cr>
else
  nmap <silent> <leader>f :FZF<cr>
endif

nmap <silent> <leader>b :Buffers<cr>

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
