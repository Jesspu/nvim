lua << END
return require('packer').startup(function(use)
  -- My plugins here
use 'wbthomason/packer.nvim'
use 'windwp/nvim-autopairs'
use 'windwp/nvim-ts-autotag'
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use 'akinsho/bufferline.nvim'
use 'navarasu/onedark.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'kyazdani42/nvim-tree.lua'
use 'kyazdani42/nvim-web-devicons'
use 'lewis6991/gitsigns.nvim'
use "numToStr/FTerm.nvim"
use 'github/copilot.vim'
use 'nvim-lualine/lualine.nvim'
use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'jose-elias-alvarez/null-ls.nvim'
use 'MunifTanjim/prettier.nvim'
use 'natecraddock/workspaces.nvim'
use 'natecraddock/sessions.nvim'
use 'Pocco81/AutoSave.nvim'
end)
END


set completeopt=menu,menuone,noselect

lua << END
require('FTerm').setup({cmd = 'cmd.exe'})

vim.api.nvim_set_keymap('n', 'gt', '<C-]>', { noremap=true, silent=true })

vim.api.nvim_create_user_command('F', require('FTerm').toggle, { bang = true })
vim.api.nvim_create_user_command('FK', require('FTerm').close, { bang = true })

require('nvim-treesitter.configs').setup({
  ensure_installed = {'css', 'html', 'javascript', 'jsdoc', 'json', 'markdown', 'svelte', 'typescript', 'java'},
  highlight = {enable = true},
  autotag = {
    enable = true,
  }
})

require("bufferline").setup{options={separator_style="slant",numbers="buffer_id",diagnostic="coc",offsets={{filetype="nerdtree", text="File Explorer"}}}}
--require('nvim-ts-autotag').setup()
require('nvim-autopairs').setup({})
require('nvim-web-devicons').setup({default = true})

vim.opt.updatetime = 1000
require('autosave').setup({
    events = {"VimLeavePre", "CursorHold"},
})
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

lua << END
 -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'sd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'eslint', 'svelte', 'cssls', 'emmet_ls', 'html', 'jsonls', 'tailwindcss', 'vimls', 'tsserver', 'diagnosticls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end
END

let g:python3_host_prog='C:/Program Files/Python310'
let g:python_host_prog='C:/Program Files/Python310'

set runtimepath+=~/AppData/Local/nvim,~/AppData/Local/nvim/after
set packpath+=~/AppData/Local/nvim
source ~/AppData/Local/nvim/.vimrc
