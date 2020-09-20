"VIM Settings: basic configs already enabled in NVIM

set encoding=utf-8
set ruler
syntax enable
set ttyfast
set background=dark 
set showcmd
set laststatus=2	" Always display the status line
set encoding=utf-8
set incsearch		" Enable incremental search

" NVIM Settings:

set numberwidth=1
set clipboard+=unnamedplus
set mouse=a
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
set nobackup            " This is recommended by coc
set nowritebackup       " This is recommended by coc
set updatetime=300      " Faster completion
set timeoutlen=100      " By default timeoutlen is 1000 ms
" set signcolumn=yes      " Always show the signcolumn, otherwise it would shift the text each time
" set shortmess+=c        " Don't pass messages to |ins-completion-menu|.
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

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/	" Flag extra whitespace


" Plugins:
call plug#begin('~/.vim/plugged')


Plug 'sheerun/vim-polyglot'		" Better Syntax Support
Plug 'jiangmiao/auto-pairs'		" Auto pairs for '(' '[' '{'
Plug 'scrooloose/NERDTree'		" File Explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" Fuzzy Finder 
Plug 'joshdick/onedark.vim'

" Plugins to review

" Plug 'easymotion/vim-easymotion'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/indentpython.vim'

call plug#end()


" Theme:
" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

colorscheme onedark


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


" Mappings:

let mapleader=" "
" Move between splits with CTRL+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" TODO: Conflict with Terminator keybindings
" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <C-TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Remove search highlighting with CTRL+h
nnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Easy CAPS with CTRL+u
inoremap <c-c> <ESC>viwUi
nnoremap <c-c> viwU<Esc>

" Paths:
let g:python3_host_prog = expand("~/miniconda3/envs/nvim/bin/python3.8")
let g:node_host_prog = expand("/usr/local/bin/neovim-node-host")



let NERDTreeQuitOnOpen=1
let g:SimpylFold_docstring_preview=1


au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

