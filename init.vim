call plug#begin('~/AppData/local/nvim/site/autoload')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()

set runtimepath+=~/vimfiles,~/vimfiles/after
set packpath+=~/vimfiles
source ~/AppData/Local/nvim/.vimrc

