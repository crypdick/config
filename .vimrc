" Minimal, modern Vim configuration

if has('compatible')
  set nocompatible
endif

set encoding=utf-8
filetype plugin indent on
syntax on

" UI improvements
set number
set relativenumber
set cursorline
set signcolumn=yes
set scrolloff=5
set termguicolors
set laststatus=2

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Indentation and whitespace
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent
set autoindent

" Windows and splits
set splitbelow
set splitright
set hidden

" Completion & command-line
set wildmenu
set wildmode=longest:full,full
set pumheight=10

" Performance tweaks
set updatetime=300
set lazyredraw

" Clipboard integration when available
if has('clipboard')
  set clipboard+=unnamedplus
endif

" Better undo persistence when supported
if has('persistent_undo')
  silent! call mkdir($HOME.'/.vim/undo', 'p')
  set undofile
  set undodir=$HOME/.vim/undo
endif

" Highlight text briefly after yanking
augroup highlight_yank
  autocmd!
  if has('nvim')
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
  endif
augroup END

" Leader key for future mappings
let mapleader = " "

" Convenience mappings
nnoremap <leader>h :set hlsearch!<CR>
