set nocompatible              " be iMproved, required
set encoding=utf-8
filetype plugin indent on
syntax enable

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
Plug 'junegunn/vim-plug'                " registered vim-plug as a plugin so that Vim help for vim-plug itself is available (e.g. :help plug-options)
Plug 'altercation/vim-colors-solarized' " solarized colour scheme
Plug 'junegunn/seoul256.vim'            " seoul256 colour scheme
"Plug '/usr/bin/fzf'                     " If installed using dnf
"Plug '/usr/local/opt/fzf'               " If installed using Homebrew
Plug 'junegunn/fzf.vim'                 " fuzzy file find
Plug 'vim-airline/vim-airline'          " status & tabline
Plug 'tpope/vim-surround'               " easily add, change & delete surroundings in pairs brackets, quotes, XML & HTML tags
Plug 'tpope/vim-repeat'                 " adds support of . vim command to plugins, eg. vim-surround
Plug 'machakann/vim-highlightedyank'    " Make the yanked region apparent
Plug 'editorconfig/editorconfig-vim'    " adds support for .editorconfig files

"if has('nvim')
if has('Xnvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
endif

call plug#end()

" =============================================================================
" VIM settings
" =============================================================================

" colour scheme
set background=dark
"set background=light
colorscheme solarized
"colorscheme seoul256
"colorscheme seoul256-light

" presentation settings
set nocursorline                    " no highlight of the screen line of the cursor
set laststatus=2                    " always show the status lines
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
set hidden                          " a buffer becomes hidden when it is abandoned. Also needed for coc.nvim.
"set noautochdir                     " do not change the current working directory
set autoindent                      " automatically indent new line
set autoread                        " automatically read a file changed on disk externally to vim
set backspace=indent,eol,start
set completeopt=menu,menuone,preview
set guioptions-=T                   " disable toolbar"
set matchpairs+=<:>,=:;             " the % command also jumps for HTML tags and JavaScript assignment syntax
set shell=$SHELL                    " use current shell for shell commands
set smartindent                     " smart auto-indenting when starting a new line
set smarttab                        " samrt tabs according to shiftwidth and tabstop
set splitbelow                      " spawn horizontal splits below instead of above
set splitright                      " spawn vertical splits to the right instead of to the left

" ignore these file types when completing names and in explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" Tab settings
"set tabstop=4                       " number of spaces in a tab
"set shiftwidth=4                    " Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
set expandtab                       " expand tabs into spaces

" search settings
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

" directory settings
set nobackup            " do not write backup files. Also needed for coc.nvim.
set noswapfile          " do not write .swp files
set nowritebackup       " back up while a file is being written, then discarded. Also needed for coc.nvim.

if has("persistent_undo")
  silent !mkdir -vp ~/.backup/vim/undo/ > /dev/null 2>&1
  set backupdir=~/.backup/vim,.       " list of directories for the backup file
  set directory=~/.backup/vim,~/tmp,. " list of directory names for the swap file
  set undofile
  set undodir=~/.backup/vim/undo/,~/tmp,.
endif

" folding
if has("folding")
  set foldcolumn=0        " columns for folding
  set foldmethod=syntax
  set foldlevel=9
  set nofoldenable        "dont fold by default "
endif

" =============================================================================
" PLUGIN CONFIGS
" =============================================================================

" -----------------------------------------------------------------------------
" FZF config
" -----------------------------------------------------------------------------
if executable('fzf')
  let g:fzf_command_prefix = 'Fzf'
endif

" -----------------------------------------------------------------------------
" EDITORCONFIG config
" -----------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns=['fugitive://.*', 'scp://.*']

" -----------------------------------------------------------------------------
" VIM-AIRLINE config
" -----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1            " displays all buffers when there's only one tab open

" -----------------------------------------------------------------------------
" KEY MAPPING config
" NB. Do not put comments on rhs as they are considered part of the rhs
" -----------------------------------------------------------------------------

" Set leader key
let mapleader      = "\\"
let maplocalleader = "\\"

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

" ----------------------------------------------------------------------------
" Files and folders
" ----------------------------------------------------------------------------

" Fuzzy find with fzf.
nnoremap <C-p> :FZF<CR>

" Fuzzy find on FZF Buffers
nnoremap <Leader>p :Buffers<CR>

" ----------------------------------------------------------------------------
" Insert text
" ----------------------------------------------------------------------------
" Quickly insert a timestamp in ISO8601 format
nnoremap <Leader>ds "=strftime("%Y-%m-%d")<CR>p
"nnoremap <Leader>ts "=strftime("%F %T%z")<CR>p
nnoremap <Leader>ts "=strftime("%Y-%m-%dT%H:%M:%SZ")<CR>p

" ----------------------------------------------------------------------------
" Terminal mode
" ----------------------------------------------------------------------------
if has('nvim')

    " To be in insert mode when entering a terminal buffer
    autocmd TermOpen term://* startinsert
    autocmd BufEnter term://* startinsert

    " To map <Esc> to exit terminal-mode: >
    tnoremap <Esc> <C-\><C-N>
    tnoremap <C-[> <C-\><C-N>

    " To simulate |i_CTRL-R| in terminal-mode: >
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

    " To use `CTRL+{h,j,k,l}` to navigate windows from any mode: >
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l

endif

" -----------------------------------------------------------------------------
" COC.NVIM config
" -----------------------------------------------------------------------------
if has('Xnvim')

    " CoC Extentions
    let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-yaml', 'coc-stylelint', 'coc-xml']

    " Better display for messages
    set cmdheight=2

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if has('patch8.1.1068')
      " Use `complete_info` if your (Neo)Vim version supports it.
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

endif

