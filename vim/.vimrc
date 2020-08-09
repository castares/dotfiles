set number
set mouse=a
set numberwidth=1
set clipboard+=unnamedplus
set showcmd
set ruler
set encoding=utf-8
set showmatch
set relativenumber
set wrap
set textwidth=79

syntax enable

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off
" For plug-ins to load correctly.
filetype plugin indent on
" Turn off modelines
set modelines=0

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

call plug#begin('~/.vim/plugged')

" Themes
" Plug 'sonph/onehalf', {'rtp': 'vim/'}

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" colorscheme onehalfdark
" let g:airline_theme='onehalflight'
" lightline
" let g:lightline.colorscheme='onehalfdark'

let NERDTreeQuitOnOpen=1

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :x<CR>

