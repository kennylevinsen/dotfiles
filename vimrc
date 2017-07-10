" Go away VI!
set nocompatible
set shell=/bin/sh

" <Vundle stuff>
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" </Vundle stuff>

" Plugins

Plugin 'junegunn/fzf'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'tomasr/molokai'

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
let NERDTreeIgnore = ['\.o$', '\.pyc$']

" Line-wrap, tabs, bracket matching
set wrap
set linebreak
set expandtab
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

" Fix mouse
if has('mouse_sgr')
   set ttymouse=sgr
endif


" Vim stuff
set backupdir=~/.vim/backup    " Backup store
set directory=~/.vim/swap      " Swap store
set backspace=indent,eol,start " Change backspace behaviour to be more sensible
set whichwrap+=<,>,[,]         " Allow left/right cursor at SOL/EOL to do as expected
set shortmess=atI              " Slighty change dialogues, suppress intro
set wildmenu                   " Enhance command line completion
set clipboard=unnamed          " Use OS clipboard by default
set hidden                     " Allow hidden buffers

if !empty($DISPLAY)
   if has('nvim')
      set clipboard=unnamedplus
   else
      set clipboard=unnamed
   endif
endif

" Helper functions
function! LineHome()
   let x = col('.')
   execute "normal ^"
   if x == col('.')
      execute "normal 0"
   endif
   return ""
endfunction

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
   let open_buffers = []

   for i in range(tabpagenr('$'))
      call extend(open_buffers, tabpagebuflist(i + 1))
   endfor

   for num in range(1, bufnr("$") + 1)
      if buflisted(num) && index(open_buffers, num) == -1 && getbufvar(num, '&mod') == 0
         exec "bdelete ".num
      endif
   endfor
endfunction

"
" Mappings
"

" C-a/C-e home/end handling
map <silent> <C-e> <End>
imap <silent> <C-e> <End>
map <silent> <C-a> <Home>
nmap <silent> <C-a> :call LineHome()<CR>
imap <silent> <C-a> <C-R>=LineHome()<CR>

" C-z as undo - Disables ability to suspend VIM
"map <C-z> :normal u<CR>
"imap <C-z> <C-o>u

" Command-z/Command-Shift-z undo/redo
map <D-z> :normal u<CR>
imap <D-z> <C-o>u
map <D-S-z> <C-r>
imap <D-S-z> <C-o><C-r>

nmap <C-t> :FZF<CR>

if has('nvim')
   tmap <C-g><C-c> <C-\><C-n>
endif
