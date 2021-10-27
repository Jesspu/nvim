"Prettier - Make the document pretty"
command! -nargs=0 P :CocCommand prettier.formatFile

"Toggle File Explorer"
command! E :NERDTreeToggle

"File Search - use ctrlp to search for a file"
command! FS :CtrlP trim(execute('pwd'))

"Refresh Vim - Reload the source .vimrc"
command! RF :so ~/AppData/Local/nvim/.vimrc

"Search and replace global
command! -nargs=1 SR :%s/<args>/g

"Search and replace global with confirm
command! -nargs=1 SRC :%s/<args>/gc

"Word Search - vimgrep for a word in a document"
command! -nargs=1 WS noautocmd vimgrep /<args>/gj `git ls-files` | cw



