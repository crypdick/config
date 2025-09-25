" Ricardo Decal's vimrc


" VUNDLE BLOCK
" Don't try to be like vi
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

" personal wiki
Plugin 'vimwiki/vimwiki'

" Automated Vim session management with file auto-save and persistent undo history 
Plugin 'thaerkh/vim-workspace'

" fancy start screen
Plugin 'mhinz/vim-startify'

" theming
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" automagically figure out indent settings from context
Plugin 'tpope/vim-sleuth'

" configs everyone can agree on (adds relative line numbers)
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

" autocompletion
"Plugin 'zxqfl/tabnine-vim'
" Plugin 'Valloric/YouCompleteMe' replacing with tabnine
" tab autocompletion
Plugin 'ervandew/supertab'

" python code folding
Plugin 'tmhedberg/SimpylFold'

" commenting with [count]<leader>cc
Plugin 'preservim/nerdcommenter'

" git integration
Plugin 'tpope/vim-fugitive'

" syntax checking
Plugin 'vim-syntastic/syntastic'
" Plugin 'davidhalter/jedi-vim'  recommended by Steve

" filesystem browser
Plugin 'scrooloose/nerdtree'

" PlantUML
Plugin 'tyru/open-browser.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'weirongxu/plantuml-previewer.vim'

"devicons. NOTE LOAD LAST
Plugin 'ryanoasis/vim-devicons'


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

" for vim-devicons
set encoding=UTF-8


let g:workspace_autosave_always = 1

"     needed for vimwiki
filetype plugin on
syntax on

let g:vimwiki_list = [{'path': '~/src/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]

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

" enable fzf
set rtp+=~/.fzf

" remap leader
" let mapleader=","
" increase timeout for leader
set timeout timeoutlen=1200

" remap nerdcommenter comment toggler
nmap <C-/> <plug>NERDCommenterToggle
xmap <C-/> <plug>NERDCommenterToggle

" remap / so that searches are case-insensitive, but substitutions searches
" remain case-sensitive
nnoremap / /\c
nnoremap ? ?\c

" copy paste across vim terminals
" https://askubuntu.com/a/620272/422690
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>
