syntax on
filetype plugin indent on
set nowrap
set expandtab
set virtualedit=all
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set number
set gdefault
set showmatch
set incsearch
set ignorecase
set smartcase

set t_Co=256
set background=dark

" create dir first ~/.vim/undo
set undofile
set undodir=~/.vim/undo
set mapleader ;

set hlsearch
nnoremap <leader>n :noh<enter>
nnoremap e <end>
nnoremap <leader>w :up<enter>
nnoremap <leader>u :%! sort -u <enter>
nnoremap <leader>q :q<enter>
nnoremap <leader>a :wa<enter>

highlight ColorColumn ctermbg=160 guibg=#D80000if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

colors desert
