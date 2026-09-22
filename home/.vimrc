" Minimal, plugin-free. Also loaded by IdeaVim via ~/.ideavimrc.

let mapleader=","

" Escape with jk
inoremap jk <Esc>l

" No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move between splits with ctrl+hjkl, open new ones right and below
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Close the buffer without closing the split (,d)
nmap <Leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

set clipboard=unnamed
set number relativenumber
set cursorline
set scrolloff=3
set mouse=a
set ignorecase smartcase
set incsearch hlsearch
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set backspace=indent,eol,start
set wildmenu
set noerrorbells visualbell t_vb=
set shortmess=atI
set encoding=utf-8 nobomb
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//

syntax on
filetype plugin indent on
