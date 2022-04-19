"Prettier - Make the document pretty"
command! -nargs=0 P :Prettier

"Toggle File Explorer"
command! E :NvimTreeToggle

command! R :NvimTreeRefresh

command! S :Telescope live_grep
command! SF :Telescope git_files
command! SW :Telescope workspaces

"Refresh Vim - Reload the source .vimrc"
command! RF :so ~/AppData/Local/nvim/.vimrc

"Search and replace global
command! -nargs=1 SR :%s/<args>/g

"Search and replace global with confirm
command! -nargs=1 SRC :%s/<args>/gc

"Generate Tags
command! GT :!ctags -R --exclude=node_modules --exclude=.git --exclude=android --exclude=ios --exclude=www --exclude=public --exclude=package.json --exclude=package-lock.json --exclude=Session.vim --exclude=.undodir --exclude=.idea --exclude=.sonar --exclude=cypress --exclude=test --exclude=resources --exclude=cypress.json --exclude=debug.keystore --exclude=debug.keystore.lock --exclude=README.md --exclude=bash.exe.stackdump --exclude=sh.exe.stackdump
