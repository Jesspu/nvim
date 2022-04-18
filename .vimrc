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
    let g:autoclose_break_brackets = 1
    source ~/AppData/Local/nvim/plugins/autoclose.vim

    "Bufferline
    source ~/AppData/Local/nvim/plugins/bufferline.vim

    "NerdTree"
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeShowHidden = 1

    "vim-svelte-plugin"
    let g:vim_svelte_plugin_use_sass = 1

    "Easy Motion"
    source ~/AppData/Local/nvim/plugins/easymotion.vim


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

" Autocomplete"
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

autocmd vimenter * nested :Telescope workspaces
autocmd vimleavepre * nested :NERDTreeClose
autocmd vimleavepre,bufleave,insertleave * nested silent! :w

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
