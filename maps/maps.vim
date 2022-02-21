 "Leader
    let mapleader = ";" " map leader to ;

"INSERT MAPS"

"NORMAL MAPS"
    "Show documentaion for function under cursor"
    nnoremap <silent> K :call ShowDocs()<CR>

    "Move to tabs left and right
    nnoremap H gT
    nnoremap L gt

    "Remap ' to `
    noremap ' `

    " Jump to definition
    nmap <silent> gd :call CocAction('jumpDefinition')<CR>

    " Fast Save
    nmap <leader>w :w!<cr>

    " Quickly jump between views
    nnoremap L <C-w>l<Enter>
    nnoremap H <C-w>h<Enter>
