call plug#begin('~/AppData/local/nvim/site/autoload')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'Pocco81/AutoSave.nvim'
Plug 'thaerkh/vim-workspace'
Plug 'Valloric/MatchTagAlways'
Plug 'mattn/emmet-vim'
call plug#end()

lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = false,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF

set runtimepath+=~/AppData/Local/nvim/vimfiles,~/AppData/Local/nvim/vimfiles/after
set packpath+=~/AppData/Local/nvim/vimfiles
source ~/AppData/Local/nvim/.vimrc

