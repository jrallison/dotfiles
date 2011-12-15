set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
set hidden                      " Allows vim to handle multiple buffers more efficiently
set laststatus=2                " Show status line
filetype plugin indent on       " load file type plugins + indentation
syntax enable
let mapleader = " "             " change modifier key to space

"" Temporary files
set backupdir=~/.tmp,/var/tmp,/tmp
set directory=~/.tmp,/var/tmp,/tmp

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Plugins
call pathogen#infect()          " load pathogen
call pathogen#helptags()        " load pathogen helptags
let g:loaded_netrwPlugin = 1    " disable netrw plugin

"" Theme
color vilight                   " set vilight as the color theme

"" GUI
set guioptions-=T               " Toggle off toolbar
set guifont=Monaco:h13

"" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
