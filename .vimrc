call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'

  Plug 'dense-analysis/ale'

  Plug 'ervandew/supertab'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  Plug 'hashivim/vim-terraform'

  Plug 'juliosueiras/vim-terraform-completion'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'rhysd/vim-crystal'
  Plug 'rust-lang/rust.vim'

  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-ruby/vim-ruby'
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

nmap <leader>f :set hlsearch<cr>:Rg<space>

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

