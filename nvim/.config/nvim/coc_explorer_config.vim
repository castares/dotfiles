
let g:coc_explorer_global_presets = {
\   'nvim': {
\     'root-uri': '~/config/nvim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nmap <silent> <leader>e :CocCommand explorer<CR>
nmap <space>ed :CocCommand explorer --preset nvim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>
nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
nmap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nmap <space>el :CocList explPresets<CR>

" AutoReload
autocmd User CocDiagnosticChange,CocGitStatusChange
    \ call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['refresh'])
