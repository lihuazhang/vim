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
Bundle 'vim-scripts/restore_view.vim'

""
"" Themes and Colors
""
Bundle 'flazz/vim-colorschemes'
Bundle 'bling/vim-airline'

""
"" Programming
""
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif


filetype plugin indent on     " required!


"" Settings

set history=700
set nocompatible
set nu
syntax on
set hidden
set howmatch
set cursorline
set visualbell
set mouse=a
set mousehide

""
"" encoding
""
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set termencoding=utf-8

""
"" Status line
""
set laststatus=2
set showmode
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
set nowrap
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
set wildmenu
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*,*.bak


