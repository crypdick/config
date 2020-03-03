" Richard Decal's vimrc

" enable fzf
set rtp+=~/.fzf

" VUNDLE BLOCK
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" motions on speed
Plugin 'easymotion/vim-easymotion'
Plugin 'vimwiki/vimwiki'
Plugin 'thaerkh/vim-workspace'
Plugin 'mhinz/vim-startify'
" Plugin 'Valloric/YouCompleteMe' replacing with tabnine
Plugin 'vim-airline/vim-airline'
" automagically figure out indent settings from context
Plugin 'tpope/vim-sleuth'
" configs everyone can agree on (adds relative line numbers
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'zxqfl/tabnine-vim'
Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'davidhalter/jedi-vim'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"



let g:workspace_autosave_always = 1

"     needed for vimwiki
filetype plugin on
syntax on

" see end of https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" input command feedback
" https://stackoverflow.com/a/8160809/4212158
set showcmd
