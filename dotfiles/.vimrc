" Settings
set secure
set modeline
set spelllang=en
set mouse=nv
set nostartofline
set title
set autoread

set clipboard=unnamedplus
set noshowmode
set scrolloff=6
set number
set cmdheight=1
set updatetime=300
set cursorline
set hidden
set nobackup
set splitbelow
set splitright
set signcolumn=yes
set shortmess+=c
set fillchars+=fold:.
syntax on

" Tab completion menu
set wildmenu
set wildmode=full

" Undo
set undolevels=1000
set undofile

" Search 
set showmatch
set matchtime=0
set incsearch
set hlsearch
set ignorecase
set inccommand=nosplit
set smartcase

" Line breaking 
set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40
highlight ColorColumn ctermbg=0

" Indentation
set copyindent
set preserveindent
filetype plugin indent on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Remmap command mode
nnoremap ; :

nnoremap jk <esc>
nnoremap kj <esc>

" Run commands in current file
nnoremap sc :%! 


" Switch tab
nmap tn :tabedit<Return>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Set leader key
let mapleader = " "

" Quick save
nnoremap <leader>w :up<CR>

" Quickly select the text you just pasted
nnoremap gV `[v`]

" Automatically jump to end of pasted text
noremap <silent> p p`]
nnoremap <silent> p p`]

" Traverse buffer list more easily.
nnoremap <leader>h :bfirst<CR>
nnoremap <leader>j :bprevious<CR>
nnoremap <leader>k :bnext<CR>
nnoremap <leader>l :blast<CR>

" Create splits
nnoremap sv <C-w>v <CR>
nnoremap ss <C-w>s <CR>

" Split motion
nnoremap <silent> sh <C-w>h
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l

" Turn off search highlighting
nnoremap sn :noh<CR>

