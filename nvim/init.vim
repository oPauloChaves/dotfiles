set nocompatible " disable vi compatibility

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json'] }
Plug 'w0rp/ale'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx', 'eruby' ]}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'wincent/ferret'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" https://github.com/Valloric/YouCompleteMe/issues/1751
" install cmake first
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --js-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

filetype plugin indent on


" General {{{
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set autoread " detect when a file is changed

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

" Search on the oposite of the file when reaching end/beginning
set wrapscan

" Ignore case when searching (unless using capital letters)
set ignorecase
set smartcase

" use forward slash
set shellslash

" Height of command line
set ch=1

" No beeping
set visualbell

" Searching
set hlsearch                         " highlight search results
set incsearch                        " set incremental search, like modern browsers
set nolazyredraw                     " don't redraw while executing macros

set magic                            " Set magic on, for regex

" error bells
set noerrorbells
set t_vb=
set tm=500

set ttyfast                          " make laggy connections work faster

" Timeout for waiting after pressing <leader>
set timeoutlen=500
" }}}

" General Mappings {{{
" set a map leader for more key combos
let mapleader = ','

" Map : to ; (to avoid using SHIFT)
nnoremap ; :

" shortcut to save
nmap <leader>, :w<cr>

" Quick toggle between buffers
noremap <leader>j :b#<CR>

"" Tab navigation
noremap <leader>w :tabnext<CR>
noremap <leader>q :tabprevious<CR>
noremap <leader>t :tabnew<CR>

"" Buffer navigation
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>c :bd<CR>

" Delete all buffers
nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<CR>

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
noremap <Leader>h :sb
noremap <Leader>v :vert sb

" Quickly open/reload vim
nnoremap <leader>ev :e! ~/.config/nvim/init.vim<CR>
nnoremap <leader>er :source ~/.config/nvim/init.vim<CR>

" Toogle `set list`
nnoremap <leader>l :set list!<CR>

" Indent the whole source code
nnoremap <leader>ii gg=G
" }}}

" Appearance {{{
" Don’t break lines
set textwidth=0
set nowrap

set number                " show line numbers
set autoindent            " automatically set indent of new line
set laststatus=2          " show the satus line all the time
set so=7                  " set 7 lines to the cursors - when moving vertical
set hidden                " current buffer can be put into background
set noshowmode            " don't show which mode disabled for PowerLine
set scrolloff=3           " lines of text around cursor
set shell=$SHELL
set cmdheight=1           " command bar height
set title                 " set terminal title
set showmatch             " show matching braces
set mat=2                 " how many tenths of a second to blink

" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" Highlight line with cursor
set cursorline

" Show line and row of the cursor
set ruler

" Better command line completion
set wildmenu

" Complete files like a shell
set wildmode=list:longest,list:full

" Don’t syntax highlight lines longer than 800 characters
set synmaxcol=400

" Visuall select of just pasted stuff
nnoremap gp `[v`]
nnoremap gy `[v`]y

" Keep the window centered
noremap G Gzzzv
noremap n nzzzv
noremap N Nzzzv
noremap } }zzzv
noremap { {zzzv
" }}}

" Autocmd Rules {{{
" Remove unwanted whitespace when saving
autocmd BufWritePre * silent! %s/\s\+$//e

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
" }}}

"" ############################## Plugin Config ###############################

" vim-session {{{
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
" }}}

" NERDTree {{{
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
" }}}

" vim-fugitive {{{
nmap <silent><leader>gs :Gstatus<cr>
nmap <silent><leader>gb :Gblame<cr>
" }}}

" ALE {{{
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop'],
\ 'html': []
\}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 0
" }}}

" Prettier {{{
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
nnoremap <Leader>p :Prettier<CR>
" }}}

" JSON {{{
let g:vim_json_syntax_conceal = 0
" }}}

" emmet {{{
let g:user_emmet_settings = {
\  'javascript.jsx': {
\    'extends': 'jsx',
\  },
\}
let g:user_emmet_leader_key='<C-E>'
" }}}

" FZF {{{
let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
  " if in a git project, use :GFiles
  nmap <silent> <leader>f :GFiles --cached --others --exclude-standard<cr>
else
  " otherwise, use :FZF
  nmap <silent> <leader>f :FZF<cr>
endif

" Display available mappings
nmap <silent> <leader>b :Buffers<cr>

" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<c-j>"
" }}}

"" ############################## Colorsche Config ############################

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Syntax highlighting
syntax on

if (has("termguicolors"))
  set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" LightLine {{{
let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\       [ 'gitbranch' ],
\       [ 'readonly', 'filetype', 'filename' ]],
\   'right': [ [ 'percent' ], [ 'lineinfo' ],
\       [ 'fileformat', 'fileencoding' ],
\       [ 'linter_errors', 'linter_warnings' ]]
\ },
\ 'component_expand': {
\   'linter': 'LightlineLinter',
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOk'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ 'component_function': {
\   'fileencoding': 'LightlineFileEncoding',
\   'filename': 'LightlineFileName',
\   'gitbranch': 'LightlineGitBranch'
\ },
\ 'tabline': {
\   'left': [ [ 'tabs' ] ],
\   'right': [ [ 'close' ] ]
\ },
\ 'tab': {
\   'active': [ 'filename', 'modified' ],
\   'inactive': [ 'filename', 'modified' ],
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

function! LightlineFileName() abort
  let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
  if filename =~ 'NERD_tree'
    return ''
  endif
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineFileEncoding()
  " only show the file encoding if it's not 'utf-8'
  return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

function! LightlineLinter() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '' : printf('×%d', l:counts.total)
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : '⚠ ' . printf('%d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:counts.total == 0 ? '' : '✖ ' . printf('%d', all_errors)
endfunction

function! LightlineLinterOk() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? 'OK' : ''
endfunction

function! LightlineGitBranch()
  return ' ' . (exists('*fugitive#head') ? fugitive#head() : '')
endfunction

augroup alestatus
  autocmd User ALELint call lightline#update()
augroup end
" }}}

""" Go {{{
nmap <silent> <leader>ip :GoImports<cr>
""" }}}

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_filetype_specific_completion_to_disable = {
\ 'ruby': 1
\}

" vim-polyglot {{{
let g:polyglot_disabled = ['ruby']
" }}}
