" Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'

Plug 'HerringtonDarkholme/yats.vim'

Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'

Plug 'patstockwell/vim-monokai-tasty'
Plug 'vim-airline/vim-airline'

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
set noerrorbells visualbell t_vb=

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
function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
