" VIM Settings: basic configs already enabled in NVIM

set encoding=utf-8
set ruler
syntax enable
set ttyfast
set background=dark 
set showcmd
set laststatus=2	" Always display the status line
set incsearch		" Enable incremental search

" NVIM Settings:

set tabstop=4   " Insert 4 spaces for a tab
set numberwidth=1
set clipboard+=unnamedplus
set mouse=a
set number
set relativenumber
set wrap
set showmode
set hidden
set iskeyword+=-	" treat dash separated words as a word text object"
set formatoptions-=cro	" Stop newline continution of comments
set pumheight=10	" Makes popup menu smaller
set splitbelow		" Horizontal splits will automatically be below
set splitright		" Vertical splits will automatically be to the right
set t_Co=256		" Support 256 colors
set conceallevel=0	" So that I can see `` in markdown files
set ignorecase		" Include matching uppercase words with lowercase search term
set smartcase		" Override the 'ignorecase' option if the search pattern contains upper
set hlsearch		" Highlight matching search patterns
set matchpairs+=<:>	" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set showmatch		" When a bracket is inserted, briefly jump to the matching one 
set updatetime=300      " Faster completion
set showtabline=2   " Always show tabs

"Map Leader:
let mapleader="\<Space>"

" Paths:
let g:python3_host_prog = expand("~/.conda/envs/neovim/bin/python3.8")
let g:node_host_prog = expand("/usr/local/bin/neovim-node-host")

" Sourcing Config Files:
source $HOME/.config/nvim/plugged.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/onedark_config.vim
source $HOME/.config/nvim/coc_config.vim
source $HOME/.config/nvim/airline_config.vim
source $HOME/.config/nvim/ranger_config.vim
source $HOME/.config/nvim/commenter_config.vim


" Enable folding
set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py "Python indentation
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css	"JS HTML CSS indentation
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2




let g:SimpylFold_docstring_preview=1




