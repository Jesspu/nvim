"Airline
    source ~/AppData/Local/nvim/plugins/airline.vim

"Function Source"
source ~/AppData/Local/nvim/functions/functions.vim

"Commands Source"
source ~/AppData/Local/nvim/commands/commands.vim

"Maps Source"
source ~/AppData/Local/nvim/maps/maps.vim

"Plugins Sources"
    "CtrlP
    source ~/AppData/Local/nvim/plugins/ctrlp.vim

    "Emmet
    source ~/AppData/Local/nvim/plugins/emmet.vim

    "Workspace
    source ~/AppData/Local/nvim/plugins/workspace.vim

    "Auto Close
    source ~/AppData/Local/nvim/plugins/autoclose.vim

    "Bufferline
    source ~/AppData/Local/nvim/plugins/bufferline.vim

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

    "Set italics
    let g:onedark_terminal_italics=1

    "Turn syntax on
    syntax on

    "Set colorscheme
    colorscheme onedark

"General"

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
