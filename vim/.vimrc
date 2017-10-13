" set vim plugin config
" vim-plug
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/incsearch.vim'
Plug 'dracula/vim'
Plug 'mhinz/vim-signify'

call plug#end()

" <Leader> key set
let mapleader = "\<Space>"

" autoload config
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" file type
filetype on
filetype plugin on

" line number
set number
set laststatus=2
set ruler

" hight current line
set cursorline
set cursorcolumn
set hlsearch

" syntax
syntax enable
syntax on

" search
set incsearch
set ignorecase
set nocompatible
set wildmenu

" font config
set guifont=Source\ Code\ Pro\ 15
set nowrap

" indent
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" indent plugin config
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" code document
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" fzf config
" This is the default. %s is replaced with fzf command
let g:fzf_launcher = 'xterm -e bash -ic %s'
" Use urxvt instead
let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'

" ale config
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" code fold
set foldmethod=indent
" set foldmethod=syntax
" start vim close code fold
set nofoldenable

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" insearch config
let g:incsearch#auto_nohlsearch = 1

" theme
" solarized light
" colorscheme solarized
" set background=light
" let g:solarized_termcolors=256

" molokai
" colorscheme molokai
" set background=dark
" let g:molokai_original = 1
" let g:rehash256 = 1

" dracula theme
color dracula

