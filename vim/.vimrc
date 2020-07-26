set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
" set relativenumber
set t_Co=256

call plug#begin('~/.vim/plugged')

" Themes
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

colorscheme onehalfdark
let g:airline_theme='onehalflight'
" lightline
" let g:lightline.colorscheme='onehalfdark'

let NERDTreeQuitOnOpen=1

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :x<CR>

