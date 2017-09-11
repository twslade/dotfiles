syntax enable

colorscheme desert

set backspace=indent,eol,start
let mapleader = ','
set number
set linespace=15

"=================SEARCH================="
set hlsearch
set incsearch
"=================SEARCH================="


"===================MAPPINGS===================="

"Edit ~/.vimrc file
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"Turn off lingering search results highlighting
nmap <Leader><space> :nohlsearch<cr>

"===================MAPPINGS===================="

"=================AUTO COMMANDS================="
"Prevent commands from iteratively sourcing ~/vimrc
augroup autosourcing
	autocmd!
	"Automatically source the VIMRC file on save
	autocmd BufWritePost .vimrc source %
augroup END

"=================AUTO COMMANDS================="

