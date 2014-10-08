" Go away VI!
set nocompatible

" <Vundle stuff>
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" </Vundle stuff>

" Plugins

" Plugin 'koturn/vim-clipboard'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'

" <Vundle stuff>
call vundle#end()
filetype plugin indent on
" </Vundle stuff>

" Colorscheme 
set bg=dark
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" Plugin config
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Line-wrap, tabs, bracket matching
set wrap
set linebreak
set shiftwidth=3
set tabstop=3
set autoindent
set copyindent
set showmatch

" Show evil characters
set list
set listchars=tab:\ \ ,trail:.,nbsp:.

" Default encoding
set encoding=utf8 nobomb
set fileencoding=utf8

" Search
set hlsearch                   " Highlight search
set incsearch                  " Incremental search
set ignorecase                 " Ignore case normally
set smartcase                  " Become case sensitive if you type upper-case letters
set smarttab

" Visual stuff
syntax on
set cursorline                 " Highlights line with cursor
set number ruler               " Shows line numbers
set modeline                   " Shows modeline (the thing on the second last line
set showtabline=2              " Tabline (Thing on the top
set laststatus=2               " Always show status bar
set mouse=a                    " Enable mouse in all modes
set fillchars+=vert:│          " Make the vertical split continuous

" Vim stuff
set backupdir=~/.vim/backup    " Backup store
set directory=~/.vim/swap      " Swap store
set backspace=indent,eol,start " Change backspace behaviour to be more sensible
set whichwrap+=<,>,[,]         " Allow left/right cursor at SOL/EOL to do as expected
set shortmess=atI              " Slighty change dialogues, suppress intro
set wildmenu                   " Enhance command line completion
set ttyfast                    " Optimize for fast terminal connections
set clipboard=unnamed          " Use OS clipboard by default
set hidden                     " Allow hidden buffers

" Mappings
noremap <C-e> <End>
noremap <C-a> <Home>

