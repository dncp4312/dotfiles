syntax on

set nocompatible
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set number
set relativenumber
set smartindent
set nowrap
set noswapfile
set hlsearch
set ignorecase
set incsearch
set shell=/bin/zsh
set formatoptions-=cor
set path+=**
" set cursorline
" set cursorlineopt=number

highlight Comment ctermfg=8 cterm=italic,bold
highlight LineNr ctermfg=4 
" highlight CursorLineNr ctermbg=4 ctermfg=7

" set list listchars=tab:>,trail:<,nbsp:.

let @c = "ggyG"
let mapleader = " "

inoremap jk <ESC>
inoremap , ,<C-G>u
inoremap . .<C-G>u
imap <Leader>j <Backspace>

nnoremap Y y$
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <Leader><Leader> <C-^>
nnoremap <silent> <Leader>l :vsplit<CR>
nnoremap <silent> <Leader>j :split<CR>
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

map <C-A> ggVG
map <C-P> :FZF<CR>
map <silent> <C-H> :noh<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j <esc>:m .+1<CR>==
nnoremap <leader>k <esc>:m .-2<CR>==

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
"SnipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
call plug#end()

"SnipMate :
let g:snipMate = { 'snippet_version' : 1}

"Lightline :
set laststatus=2
set noshowmode
let g:lightline = { 
	         \       'colorscheme' : 'molokai',
             \       'active' 	   : {
			 \   		'left'     : [
			 \   			[ 'mode', 'paste' ],
			 \   			[ 'readonly', 'absolutepath', 'modified' ]
			 \   			],
			 \   		'right'     : [
			 \   			[ 'lineinfo' ],
			 \   		    [ 'percent'  ],
			 \   		    [ 'filetype' ],
 			 \   			],
	         \       },
			 \       'component' : {
	         \          'hellow' : 'Hey XeviL !'
	         \       },
             \    }

"Rspec :
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
