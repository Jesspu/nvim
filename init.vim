call plug#begin('~/AppData/local/nvim/site/autoload')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'rakr/vim-one'
call plug#end()

set runtimepath+=~/AppData/Local/nvim/vimfiles,~/AppData/Local/nvim/vimfiles/after
set packpath+=~/AppData/Local/nvim/vimfiles
source ~/AppData/Local/nvim/.vimrc

