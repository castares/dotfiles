" Plugins:
call plug#begin(stdpath('data') . '/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'		" Better Syntax Support
Plug 'jiangmiao/auto-pairs'		" Auto pairs for '(' '[' '{'
Plug 'scrooloose/NERDTree'		" File Explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" Fuzzy Finder 
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" Conquer of Completion. Use release branch (recommend)
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
call plug#end()

" Plugins to review
" Plug 'easymotion/vim-easymotion'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/indentpython.vim'


