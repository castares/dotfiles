" Mappings:
let mapleader="\<Space>"

" Move between splits with CTRL+hjkl
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Better indenting
" vnoremap < <GV
" vnoremap > >gv

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>tv <C-w>t<C-w>H
map <Leader>th <C-w>t<C-w>K

" CTRL+TAB in general mode will move to text buffer
nnoremap <silent> <C-TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Remove search highlighting with CTRL+n
nnoremap <silent> <C-n> :nohl<CR>
inoremap <silent> <C-n> :nohl<CR>

" Save and close with capital letters also
command W w
command Q q
command X x

" Copy path to current buffer
nmap <Leader>cn :let @+ = expand("%:p")<CR>

" Open splits:
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>h :split<CR>

" Mappings for Spanish layout keyboard
nnoremap ñ ;
nnoremap Ñ :
nnoremap - /
nnoremap _ ?

