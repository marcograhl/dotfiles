call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-rhubarb'
Plug 'dense-analysis/ale'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'rhysd/vim-crystal'
call plug#end()

syntax on

let mapleader=","

let g:terraform_fmt_on_save=1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights=0

autocmd BufRead,BufNewFile ~/repos/book-reproductions.fun/*/*.md setlocal spell
autocmd BufRead,BufNewFile ~/repos/book-reproductions.fun/*/*.md setlocal spell spelllang=fr

augroup RemoveSpaces
  autocmd!
  autocmd BufWritePre *.md silent! :%s/\%u00A0/ /g
augroup end

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <c-p> :FZF<cr>

nmap <leader>f :set hlsearch<cr>:Ack!<space>

set background=dark
set tabstop=2
set noerrorbells
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set number
set showcmd
set ruler
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set textwidth=70

