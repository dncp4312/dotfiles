syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
"set number
set relativenumber
set smartindent
set nowrap
set noswapfile
set hlsearch
set ignorecase
set incsearch

inoremap jk <ESC>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

map <C-A> ggVG
map <C-P> :FZF<CR>
map <silent> <C-H> :noh<CR>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
"SnipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
call plug#end()

let g:snipMate = { 'snippet_version' : 1}
let mapleader = "'"
let @c = "ggyG"

:set formatoptions-=or

"Lightline :
:set laststatus=2
:set noshowmode
let g:lightline = { 'colorscheme' : 'molokai' }
