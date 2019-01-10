set nocompatible              " be iMproved, required
set shell=/bin/bash

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader = ','
set number
set linespace=15

"=================SEARCH================="
set hlsearch
set incsearch
"=================SEARCH================="

colorscheme atom-dark-256
set linespace=15

"===================MAPPINGS===================="

"Edit ~/.vimrc file
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"Turn off lingering search results highlighting
nmap <Leader><space> :nohlsearch<cr>

set splitbelow
set splitright

"Easier split naviations
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Nerdtree
execute "set <M-1>=\e1"
nmap <M-1> :NERDTreeToggle<cr>


" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" turn hybrid line numbers off
:set nonumber norelativenumber
:set nonu nornu

" toggle hybrid line numbers
:set number! relativenumber!
:set nu! rnu!



"===================MAPPINGS===================="

"=================AUTO COMMANDS================="
"Prevent commands from iteratively sourcing ~/vimrc
augroup autosourcing
	autocmd!
	"Automatically source the VIMRC file on save
	autocmd BufWritePost .vimrc source %
augroup END

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"=================AUTO COMMANDS================="

