" VIM Settings: basic configs already enabled in NVIM

set encoding=utf-8
set ruler
syntax enable
set ttyfast
set background=dark
set showcmd
set laststatus=2 " Always display the status line
set incsearch       " Enable incremental search
set scrolloff=8
set termguicolors
set noerrorbells

" NVIM Settings:

set expandtab
set tabstop=4   " Insert 4 spaces for a tab
set shiftwidth=4   " Insert 4 spaces for a tab
set softtabstop=4   " Insert 4 spaces for a tab
set numberwidth=1
set clipboard+=unnamedplus
set mouse=a
set numberwidth=1
set number
set relativenumber
set wrap
set noshowmode
set hidden
set iskeyword+=-    " treat dash separated words as a word text object
set formatoptions-=cro	" Stop newline continution of comments
set pumheight=10	" Makes popup menu smaller
set splitbelow		" Horizontal splits will automatically be below
set splitright		" Vertical splits will automatically be to the right
set t_Co=256		" Support 256 colors
set conceallevel=0	" So that I can see `` in markdown files
set ignorecase		" Include matching uppercase words with lowercase search term
set smartcase		" Override the 'ignorecase' option if the search pattern contains upper
set hlsearch        " Highlight matching search patterns
set matchpairs+=<:> " Highlight matching pairs of brackets. Use the '%' character to jump between them.
set showmatch       " When a bracket is inserted, briefly jump to the matching one
set updatetime=300      " Faster completion
set showtabline=2   " Always show tabs
set noshowmode

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(stdpath('data') . '/undodir')
    " Create dirs
    silent call mkdir(myUndoDir, 'p')
    let &undodir = myUndoDir
    set undofile
    set nobackup
    set noswapfile
endif

"Map Leader:
let mapleader="\<Space>"

" Paths:
let g:python_host_prog = expand("~/.conda/envs/neovim_python2/bin/python")
let g:python3_host_prog = expand("~/.conda/envs/neovim/bin/python3.8")
let g:node_host_prog = expand("~/.nvm/versions/node/v14.15.4/bin/neovim-node-host")

" Plugins:
call plug#begin(stdpath('data') . '/plugged')

" Display Navigation:
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" Extra Features:
Plug 'liuchengxu/vim-which-key'     "Show all mappings in a list
Plug 'szw/vim-maximizer'            "Maximize a split inside an instance
Plug 'jiangmiao/auto-pairs'         " Auto pairs for '(' '[' '{'
Plug 'tpope/vim-eunuch'             "Extra Commands
Plug 'tpope/vim-commentary'         "Extra Motions
Plug 'tpope/vim-surround'           "Extra Motions
Plug 'norcalli/nvim-colorizer.lua'  "Visual Display for Color References
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'   "Session Management
Plug 'francoiscabrol/ranger.vim'    "Ranger integration
Plug 'tpope/vim-dadbod'
" FZF:
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" Fuzzy Finder
Plug 'junegunn/fzf.vim'
" Git:
Plug 'mhinz/vim-signify'    "Git changes symbols
Plug 'tpope/vim-fugitive'   "Git commands
Plug 'tpope/vim-rhubarb'    "Git browser
Plug 'junegunn/gv.vim'      "Git Commit Browser
" IDE:
Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" Conquer of Completion. Use release branch (recommend)
Plug 'metakirby5/codi.vim'
" Plug 'sheerun/vim-polyglot'		" Better Syntax Support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Snippets:
Plug 'honza/vim-snippets'
Plug 'castares/vim-odoo-snippets'

" Python:
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  "Python Syntax Highlight
Plug 'psf/black', { 'branch': 'stable' }

" JS TS HTML CSS:
Plug 'mattn/emmet-vim'

Plug 'rbgrouleff/bclose.vim'        "Buffer Close abreviation
" Plug 'scrooloose/NERDTree'		" File Explorer
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'Yggdroot/indentLine'
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
" Plug 'cjrh/vim-conda'
" Plug 'tpope/vim-obsession'
"Colorschemes:
Plug 'joshdick/onedark.vim'

call plug#end()

luafile $HOME/.config/nvim/lua/colorizer_config.lua
luafile $HOME/.config/nvim/lua/treesitter_config.lua

" Plugins to review
" Plug 'tmhedberg/SimpylFold'

" Enable folding
" set foldlevel=99
" let g:SimpylFold_docstring_preview=1




