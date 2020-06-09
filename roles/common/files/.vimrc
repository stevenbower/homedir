set t_Co=256
execute pathogen#infect()
filetype plugin indent on
autocmd FileType python setlocal shiftwidth=4 tabstop=4

syntax on

let g:solarized_termtrans = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

set background=dark
colorscheme solarized

set cursorline
set modelines=0
set hidden
set nocompatible
set shell=bash
set noerrorbells
set visualbell t_vb=
set encoding=utf-8
set showmode
set showcmd
set ttyfast
set laststatus=2
set history=1000
set ignorecase
set smartcase
set incsearch
set lazyredraw
set splitbelow
set splitright
set title
"set backspace=indent,eol,start
"set number
set ruler
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set hlsearch
"set gdefault
set scrolloff=3
set sidescroll=1
set sidescrolloff=10
set virtualedit=block,onemore
set wildmenu
set wildmode=longest,list:longest
"set endofline
set fileformat=unix
"set list listchars=tab:»-,trail:░,extends:>,nbsp:↔
"set mouse=a
"ttyset ttymouse=xterm2

set wildmenu
set wildmode=list:longest,full

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"see :help statusline
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

" Turn off help
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" Highlight current line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Trying to use completion
set complete=.,b,u,]

" Handles lines that are too big for the screen
"let &showbreak = '> '
"set cpo=n

" Turn off swap files
set noswapfile
set nobackup
set nowb
if version >= 703
  set undofile
  set undoreload=10000
  set undodir=~/.vimtmp/tmp/undo//
endif

" When you type a # character as the first character of a line,
" it pushes that to the first column. This fixes that issue
"inoremap # X<BS>#

" Use :w!! to save with sudo
cmap w!! %!sudo tee > /dev/null %

" Center view on search results
map n nzz
map N Nzz

" Clear search patterns after hitting enter/space
nnoremap <CR> :noh<CR><CR>
nnoremap <space> :noh<CR><space>

" Clear search patterns when entering insert mode
nnoremap i :noh<CR>i
nnoremap I :noh<CR>I
nnoremap a :noh<CR>a
nnoremap A :noh<CR>A
nnoremap o :noh<CR>o
nnoremap O :noh<CR>O
nnoremap s :noh<CR>s
nnoremap S :noh<CR>S
nnoremap R :noh<CR>R

" When the window is resized, fix splits
au VimResized * exe "normal! \<c-w>="

" Improve scrolling when lines wrap around
"nnoremap <silent> k gk
"nnoremap <silent> j gj
"nnoremap <silent> <Up> gk
"nnoremap <silent> <Down> gj
"inoremap <silent> <Up> <Esc>gka
"inoremap <silent> <Down> <Esc>gja

" Press w to word wrap a block
vnoremap w gq

" Easier switching between splits
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l
map <C-Left> <C-w>h

" Scroll up/down with C-j, C-k instead of C-u, C-d
noremap <C-j> <C-d>
noremap <C-k> <C-u>

" For writing text
au BufNewFile,BufRead *.txt setf txt
au FileType txt set tw=79

" only open NERDTree if no file is specified
"autocmd StdinReadPre * let s:std_in=0
"#autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Ctrl-n to open NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" vim airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"Fugitive settings
"auto clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<tab>'

