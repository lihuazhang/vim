set nocompatible
set backspace=indent,eol,start
set nobackup		" do not keep a backup file, use versions instead
set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
inoremap <C-U> <C-G>u<C-U>
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set t_Co=256
endif

let mapleader=","
let g:mapleader=","
set nu
set laststatus=2
