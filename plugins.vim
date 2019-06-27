set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'jwalton512/vim-blade'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'aperezdc/vim-template'
Plugin 'scrooloose/nerdcommenter'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/csscomplete.vim'
Plugin 'lervag/vimtex'
Plugin 'dracula/vim'
Plugin 'vim-scripts/vdm.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'vim-scripts/NesC-Syntax-Highlighting'
Plugin 'ajmwagar/vim-deus'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'rakr/vim-one'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'RRethy/vim-illuminate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'spf13/vim-autoclose'
Plugin 'javier-lopez/sml.vim'
Plugin 'fatih/vim-go'
Plugin 'KeitaNakamura/neodark.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
