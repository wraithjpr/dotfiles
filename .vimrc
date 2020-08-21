set nocompatible              " be iMproved, required
filetype off                  " required

" =============================================================================
" Install Vim plugin manager, https://github.com/junegunn/vim-plug
" =============================================================================
" install automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'machakann/vim-highlightedyank'    " Make the yanked region apparent
Plug 'tpope/vim-surround'               " easily add, change & delete surroundings in pairs brackets, quotes, XML & HTML tags
Plug 'tpope/vim-repeat'                 " adds support of . vim command to plugins, eg. vim-surround
Plug 'git://github.com/jiangmiao/auto-pairs.git'

call plug#end()

" =============================================================================
" VIM settings
" =============================================================================
filetype plugin indent on     " required
set encoding=utf-8
set mouse=nicr
syntax enable

" Set leader key
let mapleader      = "\\"
let maplocalleader = "\\"

if (has("termguicolors"))
    set termguicolors
endif

" presentation settings
set nocursorline                    " no highlight of the screen line of the cursor
set list listchars=tab:→\ ,trail:▸  " in list mode show tabs and trailing spaces
set number                          " precede each line with its line number
set numberwidth=3                   " number of columns for line numbers
"set relativenumber                  " Show the line number relative to the line with the cursor
set ruler                           " line and column number of the cursor position
set showcmd                         " Show (partial) command in status line.
set showmatch                       " Show matching brackets.
set textwidth=0                     " Do not wrap words (insert)
set visualbell t_vb=                " use visual bell instead of beeping (no flash)
set nowrap                          " Do not wrap words (view)

" Behaviour
set hidden                          " a buffer becomes hidden when it is abandoned.
set autoindent                      " automatically indent new line
set autoread                        " automatically read a file changed on disk externally to vim
set backspace=indent,eol,start
set completeopt=menu,menuone,preview,longest
set guioptions-=m                   "remove menu bar
set guioptions-=T                   "remove toolbar
set matchpairs+=<:>,=:;             " the % command also jumps for HTML tags and JavaScript assignment syntax
set shell=$SHELL                    " use current shell for shell commands
set smartindent                     " smart auto-indenting when starting a new line
set smarttab                        " samrt tabs according to shiftwidth and tabstop
set splitbelow                      " spawn horizontal splits below instead of above
set splitright                      " spawn vertical splits to the right instead of to the left
set virtualedit=block,insert        " Useful for selecting a rectangle in Visual mode and editing a table.
set wildmenu                        " Enhanced mode code completion

"ignore these file types when completing names and in explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" Tab settings
set tabstop=4                       " number of spaces in a tab
set shiftwidth=4                    " Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
set expandtab                       " expand tabs into spaces

" search settings
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

" directory settings
set nobackup            " do not write backup files.
set noswapfile          " do not write .swp files
set nowritebackup       " back up while a file is being written, then discarded.

if has('persistent_undo')
  set undofile          " save and restore undo history for a buffer
endif

" -----------------------------------------------------------------------------
" KEY MAPPING config
" NB. Do not put comments on rhs as they are considered part of the rhs
" -----------------------------------------------------------------------------

" Disable the arrow cursor keys in normal... use h,j,k,l instead!
nnoremap <Left> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
nnoremap <Right> <Nop>

"close the current window
nnoremap <C-c> <C-w>c

" To use `CTRL+{h,j,k,l}` to navigate windows from any mode: >
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remove highlighting in normal mode
nnoremap <Leader><Leader> :noh<CR>

" Move to next buffer
nnoremap <Leader>n :bnext<CR>

