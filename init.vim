let data_dir = '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/AppData/local/nvim/site/autoload')
Plug 'akinsho/bufferline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
"https://github.com/natecraddock/workspaces.nvim
Plug 'thaerkh/vim-workspace'
Plug 'mattn/emmet-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'codechips/coc-svelte', {'do': 'npm install'}
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'voldikss/vim-floaterm'
Plug 'easymotion/vim-easymotion'
Plug 'github/copilot.vim'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

lua << END
require('lualine').setup()
END

let g:python3_host_prog='C:/Program Files/Python310'
let g:python_host_prog='C:/Program Files/Python310'

set runtimepath+=~/AppData/Local/nvim,~/AppData/Local/nvim/after
set packpath+=~/AppData/Local/nvim
source ~/AppData/Local/nvim/.vimrc
