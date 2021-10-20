""""""""""
" General
""""""""""

" How much history vim remembers
set history=500

" Set to auto read changes outside of vim
set autoread
au FocusGained,BufEnter * checktime

" Fast save
nmap <leader>w :w!<cr>

""""""""""
" Line
""""""""""
set number

""""""""""
" Indents
""""""""""
set expandtab
set tabstop=4 shiftwidth=4
set lbr
set tw=500
set smarttab

set autoindent
set si
set wrap

""""""""""
" Search
""""""""""
set ignorecase
set smartcase
set incsearch
set hlsearch
set lazyredraw

set nobackup
set nowb
set noswapfile

"""""""""
" Mix
"""""""""
set showmatch
set cursorline
set mat=2

""""""""""
" Cursor
""""""""""

set scrolloff=5

""""""""""
" Maps
""""""""""
noremap ' `

""""""""""
" Workspace 
""""""""""
cd ~/Github
