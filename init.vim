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
Plug 'sheerun/vim-polyglot'
Plug 'navarasu/onedark.nvim'
"https://github.com/natecraddock/workspaces.nvim
Plug 'mattn/emmet-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'easymotion/vim-easymotion'
Plug 'github/copilot.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'natecraddock/workspaces.nvim'
Plug 'natecraddock/sessions.nvim'
call plug#end()

lua << END
require('nvim-web-devicons').setup({default = true})
require('lualine').setup()
require('onedark').load()
require('gitsigns').setup()
require'nvim-tree'.setup({
open_file = {
       quit_on_open = true
    } 
})
require("workspaces").setup({
    hooks = {
        open = {function()
          require("sessions").load(nil, { silent = true })
        end, "NvimTreeOpen"},
        add = "SessionsSave"
    }
})
require("sessions").setup({
    events = {"VimLeavePre"},
    session_filepath = ".session"
})
require('telescope').setup({
defaults = {
    mappings = {
        i = {["<Tab>"] = false}
    }
}
})
require('telescope').load_extension("workspaces")
require'lspconfig'.eslint.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.vimls.setup{}
END

lua << END
local null_ls = require("null-ls")
local prettier = require("prettier")

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.resolved_capabilities.document_range_formatting then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "html",
    "javascript",
    "json",
    "markdown",
    "scss",
    "postcss",
    "yaml",
    "svelte"
  },

  -- prettier format options (you can use config files too. ex: `.prettierrc`)
  arrow_parens = "always",
  bracket_spacing = true,
  embedded_language_formatting = "auto",
  end_of_line = "lf",
  html_whitespace_sensitivity = "css",
  jsx_bracket_same_line = false,
  jsx_single_quote = false,
  print_width = 80,
  prose_wrap = "preserve",
  quote_props = "as-needed",
  semi = true,
  single_quote = true,
  trailing_comma = "es5",
  use_tabs = true,
})
END

let g:python3_host_prog='C:/Python310'
let g:python_host_prog='C:/Python310'

set runtimepath+=~/AppData/Local/nvim,~/AppData/Local/nvim/after
set packpath+=~/AppData/Local/nvim
source ~/AppData/Local/nvim/.vimrc
