set title
set nocompatible
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

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" colors!!!
syntax on
filetype plugin indent on
set cursorline
set background=dark
colorscheme jellybeans
highlight Normal ctermbg=16
highlight NonText ctermbg=16

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" leader
let mapleader = ","
let g:mapleader = ","

" disable auto-comment
autocmd FileType * setlocal formatoptions-=cro
let g:NERDSpaceDelims = 1

if has("gui_running")
  let g:Powerline_symbols = 'fancy'
endif

" mouse/clipboard integration
set mouse=a
set clipboard=unnamed

