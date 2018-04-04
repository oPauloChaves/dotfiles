" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

" General {{{
  "" Encoding
  set encoding=utf-8
  set fileencoding=utf-8
  set fileencodings=utf-8
  set bomb
  set binary

  set autoread " detect when a file is changed

  set history=1000 " change history to 1000
  set textwidth=120

  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

  if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
  endif

  set backspace=indent,eol,start " make backspace behave in a sane manner
  "" Copy/Paste/Cut
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  endif

  if has('mouse')
    set mouse=a
  endif

  " Searching
  set ignorecase " case insensitive searching
  set smartcase " case-sensitive if expresson contains a capital letter
  set hlsearch " highlight search results
  set incsearch " set incremental search, like modern browsers
  set nolazyredraw " don't redraw while executing macros

  set magic " Set magic on, for regex

  " error bells
  set noerrorbells
  set visualbell
  set t_vb=
  set tm=500
" }}}

" Appearance {{{
  set number relativenumber " show line numbers
  set wrap " turn on line wrapping
  set wrapmargin=8 " wrap lines when coming within n characters from side
  set linebreak " set soft wrapping
  set showbreak=… " show ellipsis at breaking
  set autoindent " automatically set indent of new line
  set ttyfast " faster redrawing
  set diffopt+=vertical
  set laststatus=2 " show the satus line all the time
  set so=7 " set 7 lines to the cursors - when moving vertical
  set wildmenu " enhanced command line completion
  set hidden " current buffer can be put into background
  set showcmd " show incomplete commands
  set noshowmode " don't show which mode disabled for PowerLine
  set wildmode=list:longest " complete files like a shell
  set scrolloff=3 " lines of text around cursor
  set shell=$SHELL
  set cmdheight=1 " command bar height
  set title " set terminal title
  set showmatch " show matching braces
  set mat=2 " how many tenths of a second to blink

  " Tab control
  set noexpandtab " insert tabs rather than spaces for <Tab>
  set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
  set tabstop=4 " the visible width of tabs
  set softtabstop=4 " edit as if the tabs are 4 characters wide
  set shiftwidth=4 " number of spaces to use for indent and unindent
  set shiftround " round indent to a multiple of 'shiftwidth'

  " code folding settings
  set foldmethod=syntax " fold based on indent
  set foldlevelstart=99
  set foldnestmax=10 " deepest fold is 10 levels
  set nofoldenable " don't fold by default
  set foldlevel=1

  " toggle invisible characters
  set list
  " set listchars=tab:→\ ,eol:¬,trail:⋅

  set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

  if &term =~ '256color'
    " disable background color erase
    set t_ut=
  endif

  " enable 24 bit color support if supported
  if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
  endif

  " highlight conflicts
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

  " Load colorschemes
  " Plug 'flazz/vim-colorschemes'
  Plug 'NLKNguyen/papercolor-theme'

  " LightLine {{{
    Plug 'itchyny/lightline.vim'
    let g:lightline = {
    \ 'colorscheme': 'PaperColor',
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
      return '' . (exists('*fugitive#head') ? fugitive#head() : '')
    endfunction

    augroup alestatus
      autocmd User ALELint call lightline#update()
    augroup end
  " }}}
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

  "" Close buffer
  noremap <leader>c :bd<CR>

  "" Buffer nav
  noremap <leader>q :bp<CR>
  noremap <leader>w :bn<CR>

  "" Switching windows
  noremap <C-j> <C-w>j
  noremap <C-k> <C-w>k
  noremap <C-l> <C-w>l
  noremap <C-h> <C-w>h

  "" Clean search (highlight)
  nnoremap <silent> <leader><space> :noh<cr>

  "" Move visual block
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

  "" Split
  noremap <Leader>h :<C-u>split<CR>
  noremap <Leader>v :<C-u>vsplit<CR>

  " Quickly open/reload vim
  nnoremap <leader>ev :e! ~/.config/nvim/init.vim<CR>
  nnoremap <leader>er :source ~/.config/nvim/init.vim<CR>

" }}}

" General Functionality {{{
  " YCM {{{
    " https://github.com/Valloric/YouCompleteMe/issues/1751
    function! BuildYCM(info)
      if a:info.status == 'installed' || a:info.force
        !./install.py --js-completer
      endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_key_invoke_completion = '<C-Space>'
    let g:ycm_filetype_specific_completion_to_disable = {
    \ 'ruby': 1
    \}


  " UltiSnips {{{
    Plug 'SirVer/ultisnips' " Snippets plugin
    Plug 'honza/vim-snippets'
    Plug 'epilande/vim-react-snippets' " React.js snippets
    let g:UltiSnipsExpandTrigger="<c-j>"
  " }}}

  " Relative number {{{
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
  " }}}"

  " FZF {{{
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
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
    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

	" Easy way to select a colorscheme
    nnoremap <silent> <Leader>C :call fzf#run({
    \ 'source':
    \   map(split(globpath(&rtp, "colors/*.vim"), "\n"),
    \     "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
    \ 'sink':    'colo',
    \ 'options': '+m',
    \ 'left':    30
    \ })<CR>
  " }}}

  " {{{
    Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled = ['ruby']
  " }}}

  " search inside files using ripgrep. This plugin provides an Ack command.
  Plug 'wincent/ferret'

  " insert or delete brackets, parens, quotes in pair
  Plug 'jiangmiao/auto-pairs'

  " easy commenting motions
  Plug 'tpope/vim-commentary'

  " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
  Plug 'tpope/vim-surround'

  " tmux integration for vim
  " Plug 'benmills/vimux'

  " .editorconfig support
  Plug 'editorconfig/editorconfig-vim'

  " NERDTree {{{
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

    " Toggle NERDTree
    function! ToggleNerdTree()
      if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
      else
        :NERDTreeToggle
      endif
    endfunction
    " toggle nerd tree
    nmap <silent> <leader>k :call ToggleNerdTree()<cr>
    " find the current file in nerdtree without needing to reload the drawer
    nmap <silent> <leader>y :NERDTreeFind<cr>

    let NERDTreeShowHidden=1
  " }}}

  " vim-fugitive {{{
    Plug 'tpope/vim-fugitive'
    nmap <silent> <leader>gs :Gstatus<cr>
    nmap <leader>ge :Gedit<cr>
    nmap <silent><leader>gr :Gread<cr>
    nmap <silent><leader>gb :Gblame<cr>
  " }}}

  " ALE {{{
    Plug 'w0rp/ale' " Asynchonous linting engine
    let g:ale_change_sign_column_color = 0
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '✖'
    let g:ale_sign_warning = '⚠'

    let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tsserver', 'tslint'],
    \ 'ruby': ['rubocop'],
    \ 'html': []
    \}
    let g:ale_fixers = {}
    let g:ale_fixers['javascript'] = ['prettier']
    let g:ale_javascript_prettier_use_local_config = 1
    let g:ale_fix_on_save = 0
  " }}}

  " Prettier {{{
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    let g:prettier#exec_cmd_async = 1
    let g:prettier#autoformat = 0
    nnoremap <Leader>p :Prettier<CR>
  " }}}
" }}}

" Language-Specific Configuration {{{
  " html / templates {{{
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS

    " emmet support for vim - easily create markdup wth CSS-like syntax
    Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx', 'eruby' ]}
    let g:user_emmet_settings = {
    \  'javascript.jsx': {
    \    'extends': 'jsx',
    \  },
    \}
    let g:user_emmet_leader_key='<C-E>'
  " }}}

  " JSON {{{
    Plug 'elzr/vim-json', { 'for': 'json' }
    let g:vim_json_syntax_conceal = 0
  " }}}

  Plug 'tpope/vim-endwise', { 'for': [ 'ruby', 'bash', 'zsh', 'sh' ]}
" }}}

call plug#end()

" Colorscheme and final setup {{{
  " This call must happen after the plug#end() call to ensure

  let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1,
  \     }
  \   }
  \ }

  set background=dark
  colorscheme PaperColor
  syntax on
  filetype plugin indent on
" }}}
