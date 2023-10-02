set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif

source ~/.vimrc

