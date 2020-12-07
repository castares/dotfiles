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
let g:python_host_prog = expand("~/.conda/envs/neovim_python2/bin/python")
let g:python3_host_prog = expand("~/.conda/envs/neovim/bin/python3.8")
let g:node_host_prog = expand("/usr/local/bin/neovim-node-host")

" Plugins:
call plug#begin(stdpath('data') . '/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'		" Better Syntax Support
Plug 'jiangmiao/auto-pairs'		" Auto pairs for '(' '[' '{'
Plug 'scrooloose/NERDTree'		" File Explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" Fuzzy Finder 
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" Conquer of Completion. Use release branch (recommend)
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-commentary'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
" Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-signify'    "Git changes symbols 
Plug 'tpope/vim-fugitive'   "Git commands
Plug 'tpope/vim-rhubarb'    "Git browser
Plug 'junegunn/gv.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-surround'
Plug 'cjrh/vim-conda'

call plug#end()

" Plugins to review
" Plug 'easymotion/vim-easymotion'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/indentpython.vim'


" Sourcing Config Files:
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/onedark_config.vim
source $HOME/.config/nvim/coc_config.vim
source $HOME/.config/nvim/airline_config.vim
source $HOME/.config/nvim/ranger_config.vim
source $HOME/.config/nvim/commenter_config.vim
source $HOME/.config/nvim/fzf_config.vim
luafile $HOME/.config/nvim/colorizer_config.lua
source $HOME/.config/nvim/rainbow_parenthesis_config.vim
source $HOME/.config/nvim/startfy_config.vim
source $HOME/.config/nvim/nerdtree_config.vim
source $HOME/.config/nvim/signify_config.vim
source $HOME/.config/nvim/which_key_config.vim
source $HOME/.config/nvim/conda_config.vim
" source $HOME/.config/nvim/obsession_config.vim


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




