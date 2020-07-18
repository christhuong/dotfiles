call plug#begin('~/.vim/plugged')

" catch syntax violations
Plug 'w0rp/ale'

" search for file
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" search word
Plug 'jremmen/vim-ripgrep'

" show folder tree
Plug 'scrooloose/nerdtree'

" folder icons
Plug 'ryanoasis/vim-devicons'

" my favorite theme
Plug 'Brettm12345/moonlight.vim'

" language pack
Plug 'sheerun/vim-polyglot'

" enhance javascript syntax
Plug 'jelera/vim-javascript-syntax'

" visualise color codes
Plug 'ap/vim-css-color'

" vim status line
Plug 'itchyny/lightline.vim'

Plug 'reasonml-editor/vim-reason-plus'

" language clients server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" go to a code position
Plug 'easymotion/vim-easymotion'

" highlight redundant white space
Plug 'ntpeters/vim-better-whitespace'

" comment code
Plug 'tomtom/tcomment_vim'

" vim surround
Plug 'tpope/vim-surround'

" auto add close tag
Plug 'alvan/vim-closetag'

" Git
Plug 'tpope/vim-fugitive'

" show git diff
Plug 'mhinz/vim-signify'

" Require npm install --global import-js
Plug 'galooshi/vim-import-js'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'json', 'scss'] }

call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'reason': ['~/.config/nvim/reason-language-server.exe'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" ??
nnoremap <Esc> :noh<CR><Esc>

" Quick escape
inoremap jk <ESC>
inoremap jj <ESC>

" move codes around
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" leader key
let mapleader=" "

" Searching
noremap <leader>f :FZF<CR>
noremap <leader>a :Ag <CR>
noremap <leader>o :Buffers <CR>
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>

" Quick saving / edit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>x :x<cr>

" Split screen
noremap <leader>s :vsplit<cr>
noremap <leader>v :split<cr>

" Copy current file / folder path
nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" Git
noremap <leader>gs :Gstatus<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>gw :Gwrite<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gu :Gpull<cr>
noremap <leader>gp :Gpush<cr>

" Easy jump
map  <leader>j <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-overwin-w)

" Import current word
nmap <leader>i :ImportJSFix<cr>
nmap <leader>j :ImportJSWord<cr>
nmap <leader>g :ImportJSGoto<cr>

" ale
nmap <leader>e :ALENext<CR>
nmap <leader>d :ALEPrevious<CR>

" AleFix
let g:ale_linters = {'javascript': ['eslint', 'flow'], 'ruby': ['rubocop']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'ruby': ['rubocop']}
let g:ale_fix_on_save = 1


" nerdtree key bindings
noremap <silent><leader>m :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" Custom nerdtree
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'js', 'html', 'haml', 'css', 'erb', 'jsx', 'scss']
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0

" Vim configs
syntax on
filetype plugin indent on
set background=dark
set hidden
set encoding=UTF-8
set clipboard=unnamed
set autoindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set lazyredraw
set regexpengine=1
set expandtab
set mouse=a
set hlsearch
set incsearch
set ignorecase
set smartcase
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
set nobackup
set noswapfile
set number
set rnu

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" autocmd Syntax html,css,js,jsx,rb setlocal foldmethod=syntax
autocmd BufWritePre * StripWhitespace
autocmd BufWritePre .js,.jsx,*.css,*.less Prettier

" colors and theme
colorscheme moonlight
let g:lightline = { 'colorscheme': 'moonlight' }
let g:moonlight_terminal_italics=1

" this clears the git changes gutter background
highlight clear SignColumn

" change current line number highlight color
highlight CursorLineNr guifg=DarkGrey

if (has("termguicolors"))
 set termguicolors
endif
