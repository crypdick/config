" Ricardo Decal's vimrc

" Ensure Vim starts in nocompatible mode
if has('compatible')
  set nocompatible
endif

set encoding=utf-8
filetype plugin indent on
syntax on

" UI improvements for better readability
set number
set relativenumber
set cursorline
set signcolumn=yes
set scrolloff=5
set termguicolors
set laststatus=2

" Case-smart incremental searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Use spaces by default and keep indentation predictable
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent
set autoindent

" Friendlier buffer/window behaviour
set splitbelow
set splitright
set hidden

" Improved completion UI
set wildmenu
set wildmode=longest:full,full
set pumheight=10

" Make redraws and CursorHold events faster
set updatetime=300
set lazyredraw

" Integrate with system clipboard when possible
if has('clipboard')
  set clipboard+=unnamedplus
endif

" Persist undo history between sessions
if has('persistent_undo')
  silent! call mkdir($HOME.'/.vim/undo', 'p')
  set undofile
  set undodir=$HOME/.vim/undo
endif

" Highlight text briefly after yanking (Neovim only)
augroup highlight_yank
  autocmd!
  if has('nvim')
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
  endif
augroup END

" Define <leader> and handy toggles
let mapleader = " "

" Convenience mappings
nnoremap <leader>h :set hlsearch!<CR>
