" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'

" utilities
Plug 'scrooloose/nerdtree' 
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'w0rp/ale' " Asynchonous linting engine
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
"Plug 'jistr/vim-nerdtree-tabs'

" Install L9 and avoid a Naming conflict if you've already installed a " different version somewhere else.
set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'
Plug 'roman/golden-ratio' " applies golden ratio on current window
call plug#end()
