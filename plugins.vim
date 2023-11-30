" File              : plugins.vim
" Date              : 26.01.2021
" Last Modified Date: 26.01.2021
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"
" Theming
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
Plug 'crispybaccoon/dawn.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'arcticicestudio/nord-vim'

"Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow' " Better than kien's
"Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'junegunn/limelight.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'ctrlpvim/ctrlp.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'sudormrfbin/cheatsheet.nvim'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons' " This adds colors to the previous
Plug 'nvim-tree/nvim-tree.lua'
"Plug 'romgrk/barbar.nvim'
"Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
"Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'aperezdc/vim-template/'
Plug 'rhysd/vim-grammarous' 
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
"Plug 'ludovicchabant/vim-gutentags'
" Python!
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'psf/black'

Plug 'ilyachur/cmake4vim'
Plug 'tpope/vim-dispatch'

" Go!
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'preservim/tagbar'
Plug 'brentyi/isort.vim'

Plug 'github/copilot.vim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'jackMort/ChatGPT.nvim'
"Plug 'zbirenbaum/copilot.lua'
"Plug 'zbirenbaum/copilot-cmp'
" Initialize plugin system
call plug#end()
