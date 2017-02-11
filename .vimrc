so ~/.vim/plugins.vim


"---------Visuals------------"
syntax enable
set background=dark
set t_Co=256
colorscheme atom-dark-256
"set guifont=Fira_Code:18
set ff=unix
set backspace=indent,eol,start
let mapleader = ','  "Default leader"
set number   "Shows line number"
set softtabstop=8
set shiftwidth=8
set smarttab
set copyindent
set ignorecase "ignore case for search
set smartcase
set noerrorbells "No beep
set mouse=a "Use mouse cursor

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

" Airline
set laststatus=2 "always show the status line
set encoding=utf-8 "For unicode glyphs
set noshowmode " Hide the default mode text
