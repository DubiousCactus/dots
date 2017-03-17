so ~/.vim/plugins.vim


"---------Visuals------------"

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
	set termguicolors
endif

syntax enable
"let g:airline_theme='one' doesn't work :/
colorscheme one
set background=dark
let g:airline#extensions#tabline#enabled = 1
"set guifont=Fira_Code:18
set ff=unix
set backspace=indent,eol,start
let mapleader = ','  "Default leader"
set number   "Shows line number"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set copyindent
set ignorecase "ignore case for search
set smartcase
set noerrorbells "No beep
set mouse=a "Use mouse cursor
set t_Co=256
set t_ut= "Fix Background Color Erase


"---------Searching----------"
set hlsearch
set incsearch

"---------Mappings----------"

"Make it easy to edit the Vimrc file."
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"Turn off highlighting"
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <Leader>1 :NERDTreeToggle<cr>

"Tag search
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

"Tabs management
nmap <C-Left> :tabp<cr>
nmap <C-Right> :tabn<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>


"---------Auto-Commands-----"

"Automatically source the Vinrc file on save."
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end

"---------Split Management--------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"---------Plugins--------"

"CTRL+P
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"NERDTree
let NERDTreeHijackNetrw = 0
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Airline
set laststatus=2 "always show the status line
set encoding=utf-8 "For unicode glyphs
set noshowmode " Hide the default mode text
