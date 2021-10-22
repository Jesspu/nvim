""""""""""
" General
""""""""""
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"Airline
let g:airline_theme='onedark'

"Theme
let g:onedark_terminal_italics=1
syntax on
colorscheme onedark

"Emmet
let g:user_emmet_leader_key=','

"Workspace
let g:workspace_autosave_always = 1

" How much history vim remembers
set history=500

" Set to auto read changes outside of vim
set autoread
au FocusGained,BufEnter * checktime

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
set cindent
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

"""""Control P"""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

""""""""""
" Commands
""""""""""
command! -nargs=0 P :CocCommand prettier.formatFile
command! E :call ToggleNetRW()
command! FS :CtrlP trim(execute('pwd'))
command! RF :so ~/AppData/Local/nvim/.vimrc
command! -nargs=1 WS noautocmd vimgrep /<args>/gj `git ls-files` | cw
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
""""""""""
" Maps
""""""""""

" Auto close stuff
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

noremap ' `
" Jump to definition
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
" Fast Save
nmap <leader>w :w!<cr>

nnoremap H gT
nnoremap L gt

""""""""""
" NETWR
""""""""""
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
function ToggleNetRW()
    if exists("g:netrw_buffer") && bufexists(g:netrw_buffer)
        exe "bd".g:netrw_buffer | unlet g:netrw_buffer
    else
        Vexplore . | let g:netrw_buffer=bufnr("%")
    endif
endfunction
""""""""""
" Workspace 
""""""""""

