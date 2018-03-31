set number relativenumber
set cursorline
set showmatch "highlight matching brackets
set wildmenu "visual menu for autocompletes

syntax enable

set incsearch "search as chars entered
set hlsearch "highlight matches
nnoremap <leader><space> :nohlsearch<CR> "remove search highlight with ", "

set tabstop=4
set softtabstop=4
set expandtab "use spaces not tabs
filetype indent on "allow language-specific indents

set foldenable
set foldlevelstart=10 "open most folds by default
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za "space toggles folds

set showcmd "retains last cmd in bottom right

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

call plug#begin()
Plug 'rust-lang/rust.vim'
call plug#end()

