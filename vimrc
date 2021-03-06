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

"" tell vim to stop yelling at me.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"" load file type plugins + indentation with go runtime path
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

"" vim-go options (https://github.com/fatih/vim-go)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

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

"" Theme

"" Listing
set wildignore+=*tmp/*,*/public/*,*/node_modules/*,*/.npm/*

"" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
