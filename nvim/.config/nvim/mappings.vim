" Mappings:
let mapleader="\<Space>"

" Move between splits with CTRL+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better indenting
vnoremap < <GV
vnoremap > >gv

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" CTRL+TAB in general mode will move to text buffer
nnoremap <C-TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Remove search highlighting with CTRL+n
nnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

command W w
command Q q
command X x
