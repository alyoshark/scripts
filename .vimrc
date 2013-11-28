" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'davidhalter/jedi'
Bundle 'scrooloose/syntastic'
Bundle 'derekwyatt/vim-scala'
Bundle 'scrooloose/nerdtree'

filetype plugin indent on

" Tab behavior
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=80
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

autocmd FileType python setlocal foldmethod=indent
set foldlevel=99

" Remap VIM 0 to first non-blank character
map 0 ^

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set ffs=unix,dos,mac
set viminfo^=%

" Loading & Reading
set autoread
nmap <leader>w :w!<cr>
set wildignore=*.o,*~,*.pyc

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search related
set ignorecase
set smartcase
set hlsearch
set incsearch

" Syntax and color scheme
syntax enable
colorscheme desert
set background=dark

" Navigating
" Buffer
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap <leader>nn :NERDTreeToggle<CR>

set fileencodings=ucs-bom,utf-8,cp936,gb18030
