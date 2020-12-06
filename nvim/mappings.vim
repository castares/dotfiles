" Mappings:
let mapleader="\<Space>"

" Move between splits with CTRL+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"nmap <Leader>s <Plug>(easymotion-s2)

"NERDTree
nmap <Leader>ntf :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
map <Leader>t :NERDTreeToggle<CR>

" Better indenting
vnoremap < <GV
vnoremap > >gv
nnoremap TAB >gv

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

" Remove search highlighting with CTRL+n
nnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Easy CAPS with CTRL+u
inoremap <c-c> <ESC>viwUi
nnoremap <c-c> viwU<Esc>
