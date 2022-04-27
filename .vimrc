
"Function Source"
source ~/AppData/Local/nvim/functions/functions.vim

"Commands Source"
source ~/AppData/Local/nvim/commands/commands.vim

"Maps Source"
source ~/AppData/Local/nvim/maps/maps.vim


"Clipboard
set clipboard+=unnamedplus

"Theme"
    "Set true colors
    if (empty($TMUX))
      if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      endif
      if (has("termguicolors"))
        set termguicolors
      endif
    endif


    "Turn syntax on
    syntax on

let g:onedark_config = {
    \ 'style': 'dark',
\}
colorscheme onedark

autocmd vimenter * nested :Telescope workspaces
autocmd vimleavepre * nested :NvimTreeClose

"General"

    "No Auto fold
    set nofoldenable
    set wildmenu
    " How much history vim remembers
    set history=500

    " Set to auto read changes outside of vim
    set autoread
    au FocusGained,BufEnter * checktime

    "Turn on line numbers
    set number

    "Indintation
    set expandtab
    set tabstop=4 shiftwidth=4
    set lbr
    set tw=500
    set smarttab

    set backspace=indent,eol,start
    set autoindent
    set cindent
    set si
    set wrap

    "Search
    set ignorecase
    set smartcase
    set incsearch
    set hlsearch
    set lazyredraw
    set showmatch
    set mat=2

    "Backup Settings
    set nobackup
    set nowb
    set noswapfile


    "Cursor
    set cursorline
    set scrolloff=5
    set mouse=a

    "Terminal
    tnoremap <Esc> <C-\><C-n>
