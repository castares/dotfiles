let g:startify_session_dir = '~/projects/sessions'

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/i3/config' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' }]

let g:startify_fortune_use_unicode = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
