" plug
filetype off
call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'zhaocai/GoldenView.Vim'
call plug#end()

" general
set title
set nowrap
set backspace=2

" shh
set noerrorbells
set visualbell
set t_vb=

" tabs!
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set shiftround

" numbers!
set number
set ruler
set ls=2

" colors!!!
syntax on
filetype plugin indent on
set cursorline
set background=dark
colorscheme jellybeans

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" leader
let mapleader = ','
let g:mapleader = ','

" disable auto-comment
autocmd FileType * setlocal formatoptions-=cro

" mouse/clipboard integration
set mouse=a
set clipboard=unnamed

" autosave
autocmd FocusLost * :wa

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nmap <leader>t :FZF<CR>

" lightline
let g:lightline = {
  \   'colorscheme': 'jellybeans'
  \ }
