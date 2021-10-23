
"INSERT MAPS"
    "Auto close {(["'`
    inoremap { {}<Esc>ha
    inoremap ( ()<Esc>ha
    inoremap [ []<Esc>ha
    inoremap " ""<Esc>ha
    inoremap ' ''<Esc>ha
    inoremap ` ``<Esc>ha

"NORMAL MAPS"
    "Show documentaion for function under cursor"
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    "Move to tabs left and right
    nnoremap H gT
    nnoremap L gt

    "Remap ' to `
    noremap ' `

    " Jump to definition
    nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>

    " Fast Save
    nmap <leader>w :w!<cr>

