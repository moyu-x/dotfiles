" *****************************
" vim plugin config
" *****************************
call plug#begin()

Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-signify'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --go-completer  --js-completer --rust-completer' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'ekalinin/Dockerfile.vim'
Plug 'posva/vim-vue'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'editorconfig/editorconfig-vim'
Plug 'fisadev/vim-isort'
Plug 'mattn/emmet-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'

call plug#end()

" *****************************
" vim config
" *****************************
" <Leader> key set
let mapleader = "\<Space>"

" encoding config
set encoding=utf-8

" file type
set fileformat=unix

" oepn mouse
set mouse=a

" window
set splitbelow
set splitright

" file type
filetype on
filetype plugin on
filetype plugin indent on

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

" indent
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" other setting
set noswapfile

" *****************************
" indent plugin config
" *****************************
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" *****************************
" nerdcommenter config
" *****************************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" *****************************
" FZF config
" *****************************
" This is the default. %s is replaced with fzf command
let g:fzf_launcher = 'xterm -e bash -ic %s'
" Use urxvt instead
let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'

" *****************************
" ale config
" *****************************
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" *****************************
" airline config
" *****************************
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" *****************************
" insearch config
" *****************************
let g:incsearch#auto_nohlsearch = 1

" *****************************
" YcmCompleterMe config
" *****************************
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter='/usr/bin/python3'

" auto complecation
set completeopt=longest,menu
let g:ycm_confirm_extra_conf=0
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" keymap
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 默认tab、s-tab和自动补全冲突
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1

" other config
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

" *****************************
" NERDTree config
" *****************************
" hot-key config
map <Leader>ft :NERDTreeToggle<CR>

" automatically open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically at open folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close NERDTree at close vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree symbol
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" *****************************
" rainbow config
" *****************************
let g:rainbow_active = 1

" *****************************
" vim-better-whitespace config
" *****************************
autocmd FileType <desired_filetypes> autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

" *****************************
" yapf config
" *****************************
map <Leader>y :call yapf#YAPF()<cr>

" *****************************
" vim isort config
" *****************************
let g:vim_isort_map = '<Leader>is'
let g:vim_isort_python_version = 'python3'

" *****************************
" emment config
" *****************************
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" *****************************
" UltiSnips config
" *****************************
let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" *****************************
" Theme config
" *****************************
" colorscheme
colorscheme atom

