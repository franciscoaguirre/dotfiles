" Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'

Plug 'patstockwell/vim-monokai-tasty'

call plug#end()

" Basic configuration
set number
set relativenumber
let mapleader=","
set timeout timeoutlen=1500
syntax on
set updatetime=100
vmap < <gv
vmap > >gv
set ignorecase
set smartcase
set incsearch
nmap Q <Nop>

" Indentation
set tabstop=2 expandtab shiftwidth=2 smarttab
autocmd Filetype python setlocal tabstop=4 expandtab shiftwidth=4 smarttab
autocmd Filetype cs setlocal tabstop=4 expandtab shiftwidth=4 smarttab

" Color Scheme
colorscheme vim-monokai-tasty

" Airline config
let g:airline_theme='monokai_tasty'

" Coc config
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css', 'coc-html', 'coc-prettier', 'coc-python', 'coc-rust-analyzer', 'coc-sql', 'coc-svg', 'coc-tsserver', 'coc-toml', 'coc-todolist']
let g:coc_disable_startup_warning = 1

" Yats
let re=0

" Gitgutter config
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" NERDTree config
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
