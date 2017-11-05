source ~/.config/nvim/plugins.vim

set nocompatible              " be iMproved, required
set autoread                " detect when a file is changed
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""' "take ag as default search and consider hidden files

colorscheme koehler
set history=1000            " change history to 1000
set textwidth=120
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

set diffopt+=vertical
" Maps CTRL-A to mark everything:
map <C-a> <esc>ggVG<CR>
nnoremap <C-H> <C-W><C-H>
" shortcuts for easier split : change splitting window faster 
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <up> ddkP
nnoremap <down> ddjP
vnoremap <up> dkP
vnoremap <down> djP
inoremap jj <ESC>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap ä #
nnoremap # *
nnoremap ü [c
nnoremap + ]c

