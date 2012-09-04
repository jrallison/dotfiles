set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
set hidden                      " Allows vim to handle multiple buffers more efficiently
set number                      " Shows line number
set autoread                    " reload file when changed from the outside
set laststatus=2                " Show status line
set so=7                        " Add a 7 line buffer when navigated with j/k
filetype plugin indent on       " load file type plugins + indentation
syntax enable
let mapleader = " "             " change modifier key to space


"" CtrlP mappings
nnoremap <silent> <Leader>t :CtrlP<cr>
nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>

"" Temporary files
set backupdir=~/.tmp,/var/tmp,/tmp
set directory=~/.tmp,/var/tmp,/tmp

"" File settings
nmap <leader>w :w!<cr>          " faster saves

"" Window movements
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
let g:loaded_netrwPlugin=1      " disable netrw plugin
let g:Powerline_symbols='fancy' " disable netrw plugin

" Use git to populate files for ctrlp
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

"" Theme
color vilight                   " set vilight as the color theme

"" GUI
set guioptions-=T               " Toggle off toolbar
set guifont=Anonymous\ Pro\ for\ Powerline:h16
set transparency=5

"" Listing
set wildignore+=tmp/**,public/**

"" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
