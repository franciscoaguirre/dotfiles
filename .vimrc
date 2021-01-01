" Plugins
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'ron-rs/ron.vim'

Plug 'patstockwell/vim-monokai-tasty'

call plug#end()

" Basic configuration
set number
let mapleader=","
set timeout timeoutlen=1500
syntax on
set updatetime=100
vmap < <gv
vmap > >gv

" Indentation
set tabstop=2 expandtab shiftwidth=2 smarttab
autocmd Filetype python setlocal tabstop=4 expandtab shiftwidth=4 smarttab

" Color Scheme
colorscheme vim-monokai-tasty

" Airline config
let g:airline_theme='monokai_tasty'

" NERDTree config
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
autocmd VimEnter * if argc() == 0 | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" ALE config
let g:ale_completion_enabled=1
let g:ale_linters={'rust': ['analyzer']}
let g:ale_fixers={'rust': ['rustfmt']}
