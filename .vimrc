let g:rustfmt_autosave = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#begin()
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'tpope/vim-sensible'
Plug 'rust-lang/rust.vim'
call plug#end()

