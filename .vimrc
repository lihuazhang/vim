set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:

""
"" General
""
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
if executable('ack-grep')
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    Bundle 'mileszs/ack.vim'
elseif executable('ack')
    Bundle 'mileszs/ack.vim'
elseif executable('ag')
    Bundle 'mileszs/ack.vim'
    let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
endif
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/csapprox'
Bundle 'matchit.zip'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'godlygeek/tabular'

""
"" Themes and Colors
""
Bundle 'flazz/vim-colorschemes'
Bundle 'bling/vim-airline'

""
"" Programming
""
" Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'

if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif
Bundle 'nathanaelkane/vim-indent-guides'
"" Indent guide
""
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

filetype plugin indent on     " required!

"" Settings
let mapleader = ','
set background=dark
if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/ir_black.vim"))
  colorscheme ir_black
endif
set history=700
set nu
syntax on
set hidden
set virtualedit=onemore
set showmatch
set cursorline
highlight clear SignColumn
set visualbell
set mouse=a
set mousehide
" Comment out auto change dir
" which will break the jump function of
" rails vim
" set autochdir
" autocmd BufEnter * silent! lcd %:p:h

" Remove restore_view, since mkview will break rails vim in mac
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif



" enable setting title
set title
" " configure title to look like: Vim /path/to/file
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70


""
"" encoding
""
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set termencoding=utf-8

""
"" Paste
""
if has ('x') && has ('gui') " On Linux use + register for copy-paste
  set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
  set clipboard=unnamed
endif
set pastetoggle=<F12>

""
"" Status line
""
set showmode

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:buf%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

""
"" Backup
""
set nobackup
set nowb
set noswapfile

if has('persistent_undo')
    set undodir=~/.vim/undofiles
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

""
"" Indent
""
set smartindent
set autoindent


""
"" Whitespace and Tab
""
set wrap
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start


""
"" List
""
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""
set wildmode=list:longest,full
set wildmenu
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*,*.bak

""
"" Vundles settings
""

"" airline
""
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme='light'

" unicode symbols
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

"" NerdTree
""
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

"" ctrlp
""
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <leader>f :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" On Windows use "dir" as fallback command.
if has('win32') || has('win64')
  let g:ctrlp_user_command = {
        \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'dir %s /-n /b /s /a-d'
        \ }
else
  let g:ctrlp_user_command = {
        \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f'
        \ }
endif

"" TagBar
""
nnoremap <silent> <leader>tt :TagbarToggle<CR>

""
"" Function
""
function! <SID>StripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml,cucumber,ruby autocmd BufWritePre <buffer> call <SID>StripTrailingWhitespace()

""
"" Key mapping
""

cmap w!! w !sudo tee % >/dev/null
" Trim manually
nnoremap <silent> <leader>w :call <SID>StripTrailingWhitespace()<CR>
" check spell
nmap <silent> <leader>s :set spell!<CR>
" paste
nmap <silent> <leader>p :set paste!<CR>

