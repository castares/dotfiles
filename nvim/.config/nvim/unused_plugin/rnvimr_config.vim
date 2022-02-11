nnoremap <space>r :RnvimrToggle<CR>
tnoremap <space>r <C-\><C-n>:RnvimrToggle<CR>
nnoremap <silent> <M-r> :RnvimrToggle<CR>
tnoremap <silent> <M-r> <C-\><C-n>:RnvimrToggle<CR>

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.9 * &columns)),
            \ 'height': float2nr(round(0.9 * &lines)),
            \ 'col': float2nr(round(0.05 * &columns)),
            \ 'row': float2nr(round(0.03 * &lines)),
            \ 'style': 'minimal'
            \ }

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-h>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
