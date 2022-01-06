call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ervandew/supertab'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'hashivim/vim-terraform'
  Plug 'jacoborus/tender.vim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'miyakogi/conoline.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'sbdchd/neoformat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-ruby/vim-ruby'
  Plug 'wadackel/vim-dogrun'
call plug#end()

syntax on

let mapleader=","

let g:terraform_fmt_on_save=1

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

augroup RemoveSpaces
  autocmd!
  autocmd BufWritePre *.md silent! :%s/\%u00A0/ /g
augroup end

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <c-p> :FZF<cr>

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

nmap <leader>f :set hlsearch<cr>:Rg<space>
nmap <leader>n :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr> \| R

colorscheme nord
let g:lightline_theme = 'nord'

set background=dark
set tabstop=2
set belloff=all
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set mouse=a
set number
set completeopt=longest,menuone
set showcmd
set ruler
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set textwidth=80
set cmdheight=2
set updatetime=300
set shortmess+=c
