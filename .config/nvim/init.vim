" plug
filetype off
call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'zhaocai/GoldenView.Vim'
Plug 'scrooloose/nerdtree'
call plug#end()

" general
set title
set nowrap
set backspace=2

" shh
set noerrorbells
set visualbell

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
set termguicolors
syntax enable
filetype plugin indent on
set cursorline
set cursorcolumn
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
autocmd FocusLost * wall

" fzf
let $FZF_DEFAULT_COMMAND = "ag --hidden --ignore-dir .git --ignore '*.meta' -g ''"
nmap <leader>t :FZF<CR>

" lightline
let g:lightline = {
  \   'colorscheme': 'jellybeans'
  \ }
set noshowmode

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
set splitright
nmap <leader>b :NERDTreeToggle<CR>

" source vimrc on save
augroup auto_source_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END
