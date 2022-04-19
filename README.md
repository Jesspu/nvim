1. Clone to C:/Users/${username}/AppData/Local/nvim
2. Install the Blex font from the fonts folder
2a. Install ripgrep from chocolatly
2b. Install python from chocolatly, make sure to add to path
2ab. Install mingw from chocolatly
2abc. Git clone packer git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
2c. Install LSP - npm install -g svelte-language-server vscode-langservers-extracted emmet-ls @tailwindcss/language-server prettier typescript-language-server typescript diagnostic-languageserver
For more lsp [go here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright)
3. Launch nvim, plug should auto install, and install any missing plugins
4. Profit
