set title
set nocompatible
set nowrap

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
syntax enable
set cursorline
colorscheme jellybeans
highlight Normal ctermbg=0

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
