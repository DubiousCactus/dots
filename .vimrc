so ~/.vim/plugins.vim


"---------VIM config---------"
"Save swap files in home folder
set dir=$HOME/.vim_tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

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

if (has("termguicolors"))
	set termguicolors
endif

syntax enable
"let g:airline_theme='jet'
"let g:airline_theme='deus'
"colorscheme deus
let g:airline_theme='onedark'
let g:onedark_terminal_italics=1
colorscheme neodark
set background=dark
let g:airline#extensions#tabline#enabled = 1
set ff=unix
set backspace=indent,eol,start
let mapleader = ','  "Default leader"
set number relativenumber   "Shows line number"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set smarttab
set copyindent
set ignorecase "ignore case for search
set smartcase
set noerrorbells "No beep
"set ttymouse=xterm2
set mouse=a "Use mouse cursor
"set t_Co=256
set t_ut= "Fix Background Color Erase

set lazyredraw

" MacVim
set guioptions=
let g:polyglot_disabled = ['latex']


"--------Code Folding--------"
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"---------Proper PEP8 Indentation (for Python)------"
au BufNewFile,BufRead *.py :
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

"--------Auto line number switch -----------------"
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"----------Indentation for full-stack dev----------"
au BufNewFile,BufRead *.js, *.html, *.css :
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"------------Flag un-necessary white spaces--------------"
"define BadWhitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"-----------Python with virtualenv support--------------"
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
  "project_base_dir = os.environ['VIRTUAL_ENV']
  "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  "execfile(activate_this, dict(__file__=activate_this))
"EOF

"--------Vim Deus theme-------"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256

"---------Searching----------"
set hlsearch
set incsearch

"---------Mappings----------"

"Make it easy to edit the Vimrc file."
nmap <Leader>ev :tabedit ~/.vimrc<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Turn off highlighting"
nmap <Leader><space> :nohlsearch<cr>

"Insert new line in normal mode
nmap oo o<esc>k
nmap OO O<esc>j

"Make NERDTree easier to toggle.
nmap <Leader>1 :NERDTreeToggle<cr>

"Tabs management
nmap <C-t> :tabnew<cr>
nmap <C-Left> :tabprevious<cr>
nmap <C-Right> :tabnext<cr>

"Redo (because ctrl-r is used by CTRL-P)
nmap r :redo<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

" Run PHPUnit tests
map <Leader>ut :!vendor/bin/phpunit<cr>

" Save in 2 keystrokes
nmap <Leader>w :w<cr>

"---------Auto-Commands-----"

"Automatically source the Vinrc file on save."
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end

"Set omnifunc to complete CSS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

autocmd BufNewFile,BufRead *.grm set syntax=SML

"---------Split Management--------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"---------Plugins--------"

"CTRL+P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules|__pycache__',
  \ 'file': '\v\.(exe|so|dll|o|out|d)$|(__init__.py)',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:15,results:15'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    "Tag search
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

"NERDTree
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=[
	\ '\.aux$', '\.out$', '\.bbl$', '\.blg$', '\.fls$', '\.pdf$',
	\ '\.toc$', '\.lot$', '\.lof$', '\.bib$', '\.gz$', '\.fdb_latexmk$',
	\ '\.o$', '\.pyc$', '\~$', 'tags', 'model.ckpt.*', 'LICENSE',
	\ 'checkpoint', '__init__.py', '__pycache__', 'vendor', 'node_modules'
	\]
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
set laststatus=2 "always show the status line
set encoding=utf-8 "For unicode glyphs
set noshowmode " Hide the default mode text

"Tagbar
nmap <Leader>t :TagbarToggle<cr>

"YouCompleteMe
"let g:ycm_server_python_interpreter = "/usr/local/opt/python@3/bin/python3"
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"VDM-SL Syntax
au BufNewFile,BufRead *.vdm*     setf vdm

" Ale
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

"Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Ctrl+Space
"set nocompatible
"set hidden
"set showtabline=0
"if executable("ag")
    "let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
"endif
"nnoremap <silent><C-p> :CtrlSpace O<CR>


"Clang-Format
let g:clang_format#code_style = "mozilla"
let g:clang_format#style_options = {
	\ "AlwaysBreakAfterReturnType": "None",
	\ "AllowShortLoopsOnASingleLine": "false",
	\ "PenaltyReturnTypeOnItsOwnLine": 0,
	\ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>


" UltiSnips
"let g:UltiSnipsExpandTrigger="<return>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

