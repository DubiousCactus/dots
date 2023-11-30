" File              : .vimrc
" Date              : 26.01.2021
" Last Modified Date: 26.01.2021
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

so ~/.vim/plugins.vim


" start neovim only plugins
if has('nvim')
	"lua require 'amc/cmp'.setup()
	"lua require 'amc/gitsigns'.setup()
	"lua require 'amc/lsp'.setup()
	lua require 'amc/nvim-tree'.setup()
	"lua require 'amc/copilot'.setup()
	"lua require 'amc/copilot-cmp'.setup()
	lua require('chatgpt').setup()
	"({
		"openai_params = {
		  "model = 'gpt-3.5',
		  "frequency_penalty = 0,
		  "presence_penalty = 0,
		  "max_tokens = 300,
		  "temperature = 0,
		  "top_p = 1,
		  "n = 1,
		"},
		"openai_edit_params = {
		  "model = 'code-davinci-edit-001',
		  "temperature = 0,
		  "top_p = 1,
		  "n = 1,
		"},
	"})
endif

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
"colorscheme neodark
colorscheme onedark
let g:airline_theme='onedark'
"colorscheme nord
"let g:airline_theme='nord'
"let g:nord_cursor_line_number_background = 1
let g:onedark_terminal_italics=1
"let g:nord_italic = 1
"let g:nord_italic_comments = 1
"let g:nord_underline = 1
"let g:airline#extensions#tabline#enabled = 1
let g:username = "Théo Morales"
let g:email = "theo.morales.fr@gmail.com"
set ff=unix
set backspace=indent,eol,start
let mapleader = ','  "Default leader"
set number relativenumber   "Shows line number"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=99
set smarttab
set copyindent
set ignorecase "ignore case for search
set smartcase
set noerrorbells "No beep
"set ttymouse=xterm2
set mouse=a "Use mouse cursor
"set t_Co=256
set t_ut= "Fix Background Color Erase
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Yank to clipboard
nnoremap Y "+y
vnoremap Y "+y

set lazyredraw

" Spelling
"setlocal spell
"set spelllang=fr,en_gb
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


"--------Code Folding--------"
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
"nnoremap <space> za Disabled that because it conflicts with coc.nvim shortcuts

"---------Proper PEP8 Indentation (for Python)------"
au BufNewFile,BufRead *.py :
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    "\ set autoindent |
    \ set fileformat=unix |


" map to <Leader>cf in Python code
autocmd FileType py nnoremap <buffer><Leader>cf :<C-u>Black<CR>
autocmd FileType py vnoremap <buffer><Leader>cf :Black<CR>

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
nnoremap <Leader>ev :tabedit ~/.vimrc<cr>
nnoremap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Turn off highlighting"
nnoremap <Leader><space> :nohlsearch<cr>

"Insert new line in normal mode
nnoremap oo o<esc>k
nnoremap OO O<esc>j

"Make NERDTree easier to toggle.
"nmap <Leader>1 :NERDTreeToggle<cr>
nnoremap <Leader>1 :NvimTreeToggle<cr>
nnoremap <Leader>2 :NvimTreeFocus<cr>
nnoremap <Leader>3 :NvimTreeFindFile<cr>

"Tabs management
nnoremap <C-t> :tabnew<cr>
nnoremap <C-Left> :tabprevious<cr>
nnoremap <C-Right> :tabnext<cr>

"Redo (because ctrl-r is used by CTRL-P)
nnoremap r :redo<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal mode
imap jj <esc>

" Run PHPUnit tests
"map <Leader>ut :!vendor/bin/phpunit<cr>

" Save in 2 keystrokes
nnoremap <Leader>w :w<cr>

"---------Auto-Commands-----"

"Automatically source the Vinrc file on save."
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
	autocmd BufWritePost plugins.vim source %
augroup end

"Set omnifunc to complete CSS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

autocmd BufNewFile,BufRead *.grm set syntax=SML

"---------Split Management--------"
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>


"---------Plugins--------"

"CTRL+P
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules|__pycache__',
  "\ 'file': '\v\.(exe|so|dll|o|out|d|tar|npy)$|(__init__.py)',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:ctrlp_match_window = 'top,order:ttb,min:1,max:15,results:15'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.npy     " MacOSX/Linux
    ""Tag search
"nmap <C-R> :CtrlPBufTag<cr>
"nmap <C-e> :CtrlPMRUFiles<cr>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-o> <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <C-R> <cmd>Telescope tags<cr>

" Whatever this cool thing is
" nnoremap

" Using Lua functions
"nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <C-B> <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <C-R> <cmd>lua require('telescope.builtin').help_tags()<cr>

"NERDTree
"let NERDTreeHijackNetrw = 0
"let NERDTreeIgnore=[
	"\ '\.aux$', '\.out$', '\.bbl$', '\.blg$', '\.fls$', '\.pdf$', '\.png$',
	"\ '\.toc$', '\.lot$', '\.lof$', '\.log$', '\.gz$', '\.tar$', '\.fdb_latexmk$',
	"\ '\.o$', '\.pyc$', '\~$', 'tags', 'model.ckpt.*', 'LICENSE', '\.pkl$', '\.tgz$',
	"\ 'checkpoint', '__pycache__', 'node_modules'
	"\]
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
"set laststatus=2 "always show the status line
set encoding=utf-8 "For unicode glyphs
"set noshowmode " Hide the default mode text
let g:airline#extensions#tabline#enabled = 1

"Tagbar
nmap <Leader>t :TagbarToggle<cr>

"YouCompleteMe
"let g:ycm_server_python_interpreter = "/usr/local/opt/python@3/bin/python3"
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Ale
"let g:ale_fixers = ['prettier', 'eslint']
"let g:ale_fix_on_save = 1
"let g:ale_completion_enabled = 1

"Rainbow parentheses
let g:rainbow_active = 1


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
" map to <Leader>b in c/C++ code to build
autocmd FileType c,cpp,obj nnoremap <buffer><Leader>b :CMakeBuild<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>


"Markdown Preview
let g:mkdp_auto_start = 1
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''


"Limelight
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!


" Vimtex
let g:livepreview_previewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" Conquer of Completion
so ~/.vim/coc.vim

" Go-vim
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)


" Ultisnips
let g:UltiSnipsExpandTrigger = '<C-CR>'
let g:UltiSnipsJumpForwardTrigger = '<alt-l>'
let g:UltiSnipsJumpBackwardTrigger = '<alt-j>'

"snippet box "Box"
"`!p snip.rv = '┌' + '─' * (len(t[1]) + 2) + '┐'`
"│ $1 │
"`!p snip.rv = '└' + '─' * (len(t[1]) + 2) + '┘'`
"$0
"endsnippet

"snippet today "Date"
"`date +%F`
"endsnippet

" Terminal normal mode
:tnoremap <Esc> <C-\><C-n>

" Grammarous
"autocmd FileType md nmap <Leader><S-n>  <Plug>(grammarous-move-to-previous-error)

