"NERDTree
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>n :NERDTreeToggle <CR>
nmap <Leader>nd :NERDTreeToggle %:h:h<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
let g:plug_window = 'noautocmd vertical topleft new'


