source ~/.config/nvim/plugins.vim

set nocompatible              " be iMproved, required
set autoread                " detect when a file is changed
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""' "take ag as default search and consider hidden files

colorscheme onedark
set history=1000            " change history to 1000
set textwidth=120
" remap leader to 'ö'
nnoremap <SPACE> <Nop>
:let mapleader = " "
" set relative line number
set number
set relativenumber
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set infercase               " Completion recognizes capitalization
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab

set diffopt+=vertical
" Maps CTRL-A to mark everything:
map <C-a> <esc>ggVG<CR>
" shortcuts for easier split : change splitting window faster 
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <up> ddkP
nnoremap <down> ddjP
vnoremap <up> dkP
vnoremap <down> djP
inoremap jj <ESC>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>sf :NERDTreeFind<CR>
nnoremap <leader>m :Merginal<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>q :q<CR>
nnoremap ä #
nnoremap # *
nnoremap ü [c
nnoremap + ]c
" search and replace what is highlighted
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
" terminal
tmap <ESC> <C-\><C-N>
nnoremap <leader>t :sp <CR> <C-W><C-J> <bar> :terminal <CR> A
nnoremap <leader>vt :vsp <CR> <C-W><C-L> <bar> :terminal <CR> A
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Lightline
let g:lightline = {
\ 'colorscheme': 'onedark',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
