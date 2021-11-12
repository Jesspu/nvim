call plug#begin('~/AppData/local/nvim/site/autoload')
Plug 'akinsho/bufferline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'thaerkh/vim-workspace'
Plug 'Valloric/MatchTagAlways'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()


set runtimepath+=~/AppData/Local/nvim,~/AppData/Local/nvim/after
set packpath+=~/AppData/Local/nvim
source ~/AppData/Local/nvim/.vimrc
