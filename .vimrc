set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim
color evening
" remap leader to 'ö'
:let mapleader = "ö"
" set relative line number
set number
set relativenumber
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set infercase               " Completion recognizes capitalization
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
" set the runtime path to include CTRL-P : fuzzy file search 
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Install L9 and avoid a Naming conflict if you've already installed a " different version somewhere else.
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just 
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` 
" to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ " Put your non-Plugin stuff after this line

" Maps CTRL-A to mark everything:
map <C-a> <esc>ggVG<CR>
nnoremap <C-H> <C-W><C-H>
" shortcuts for easier split : change splitting window faster 
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <up> ddkP
nnoremap <down> ddjP
inoremap jj <ESC>
nnoremap <leader>n :NERDTreeTabsToggle<CR>
nnoremap <leader>b :OpenBookmark<SPACE>
