set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
set hidden                      " Allows vim to handle multiple buffers more efficiently
set number                      " Shows line number
set autoread                    " reload file when changed from the outside
set laststatus=2                " Show status line
set so=7                        " Add a 7 line buffer when navigated with j/k
set noswapfile                  " Don't add swap files
let mapleader = " "             " change modifier key to space

"" load file type plugins + indentation with go runtime path
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

"" format go code automatically on save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

"" Use current directory to list files in CtrlP
let g:ctrlp_working_path_mode = 'c'

"" CtrlP mappings
nnoremap <silent> <Leader>t :CtrlP<cr>
nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>

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

"" Theme
color base16                    " set base16 as the color theme
"set background=light

"" GUI
set guioptions-=T               " Toggle off toolbar
set guifont=Anonymous\ Pro\ for\ Powerline:h16
set transparency=5

"" Listing
set wildignore+=*tmp/*,*/public/*,*/vendor/*,*/node_modules/*

"" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
