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
Plug 'junegunn/vim-plug'                " registered vim-plug as a plugin so that Vim help for vim-plug itself is available (e.g. :help plug-options)
Plug 'altercation/vim-colors-solarized' " solarized colour scheme
Plug 'junegunn/seoul256.vim'            " seoul256 colour scheme
Plug 'doums/darcula'                    " darcula colour scheme
Plug 'joshdick/onedark.vim'             " onedark color scheme
Plug 'arcticicestudio/nord-vim'         " nord color scheme
Plug 'tomasr/molokai'                   " molokai color scheme. Needs let g:rehash256 = 1 to be good for 256 color terminals.
Plug 'NLKNguyen/papercolor-theme'       " PaperColor color scheme inspired by Google's material design. May need set t_Co=256.
"Plug '/usr/bin/fzf'                     " If installed using dnf
"Plug '/usr/local/opt/fzf'               " If installed using Homebrew
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'                 " fuzzy file find
Plug 'tpope/vim-surround'               " easily add, change & delete surroundings in pairs brackets, quotes, XML & HTML tags
Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'tpope/vim-repeat'                 " adds support of . vim command to plugins, eg. vim-surround
Plug 'machakann/vim-highlightedyank'    " Make the yanked region apparent
Plug 'editorconfig/editorconfig-vim'    " adds support for .editorconfig files
Plug 'severin-lemaignan/vim-minimap'
"Plug 'vimwiki/vimwiki'

if has('nvim')
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/echodoc.vim'
    "Plug 'Shougo/neosnippet.vim'
    "Plug 'Shougo/neosnippet-snippets'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
endif

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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" colour scheme
set background=dark
"set background=light
"colorscheme solarized
"colorscheme seoul256
"colorscheme seoul256-light
"ccolorscheme darcula
colorscheme PaperColor

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
set hidden                          " a buffer becomes hidden when it is abandoned. Also needed for coc.nvim, LanguageClient.
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
set nobackup            " do not write backup files. Also needed for coc.nvim.
set noswapfile          " do not write .swp files
set nowritebackup       " back up while a file is being written, then discarded. Also needed for coc.nvim.

if has('persistent_undo')
  set undofile          " save and restore undo history for a buffer
endif

" folding
if has('folding')
  set foldcolumn=0        " columns for folding
  set foldmethod=syntax
  set foldlevel=9
  set nofoldenable        "dont fold by default "
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

" ----------------------------------------------------------------------------
" Files and folders
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Insert text
" ----------------------------------------------------------------------------
" Quickly insert a timestamp in ISO8601 format
nnoremap <Leader>ds "=strftime("%Y-%m-%d")<CR>p
"nnoremap <Leader>ts "=strftime("%F %T%z")<CR>p
nnoremap <Leader>ts "=strftime("%Y-%m-%dT%H:%M:%SZ")<CR>p

" =============================================================================
" PLUGIN CONFIGS
" =============================================================================

" -----------------------------------------------------------------------------
" FZF config
" -----------------------------------------------------------------------------
if executable('fzf')
    let g:fzf_command_prefix = 'Fzf'

    " Empty value to disable preview window altogether
    let g:fzf_preview_window = ''

    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'

    " Fuzzy find with fzf.
    nnoremap <C-p> :FZF<CR>

    " Fuzzy find on FZF Buffers
    nnoremap <Leader>p :FzfBuffers<CR>
endif

" -----------------------------------------------------------------------------
" EDITORCONFIG config
" -----------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns=['fugitive://.*', 'scp://.*']

" -----------------------------------------------------------------------------
" LIGHTLINE config
" -----------------------------------------------------------------------------
if !has('gui_running')
  set t_Co=256
endif
let g:rehash256 = 1
let g:lightline = { 'colorscheme': 'PaperColor' }

set laststatus=2                    " always show the status lines
set noshowmode                      " the info is now shown in the statusline, so no need to see it again.

" -----------------------------------------------------------------------------
" VIMWIKI config
" -----------------------------------------------------------------------------

"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

" -----------------------------------------------------------------------------
" MINIMAP config
" -----------------------------------------------------------------------------

let g:minimap_highlight='Visual'
set guioptions-=r                   "remove right-hand scroll bar
set guioptions-=L                   "remove left-hand scroll bar

" -----------------------------------------------------------------------------
" LanguageClient-neovim config
" See :help LanguageClient
" -----------------------------------------------------------------------------
if has('nvim')

    " Better display for messages
    set cmdheight=2

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=500

    " don't give |ins-completion-menu| messages.
    "set shortmess+=c

    set signcolumn=yes

"    See
"    https://github.com/autozimu/LanguageClient-neovim/blob/next/doc/LanguageClient.txt
"
"        \ 'java': ['~/.local/bin/java-lsp.sh', '-data', getcwd()]
    let g:LanguageClient_serverCommands = {
        \ 'java': ['~/.local/bin/java-lsp.sh', '-data', '~/Repos/']
        \ }
    let g:LanguageClient_rootMarkers = {
        \ 'java': ['pom.xml']
        \ }

    let g:LanguageClient_loadSettings = 1
    let g:LanguageClient_settingsPath = expand('~/.vim/settings.json')
    let g:LanguageClient_loggingLevel = 'INFO'
    let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log')
    let g:LanguageClient_fzfOptions = ['--height=33%', '--layout=reverse', '--border']
    "let g:LanguageClient_hoverPreview = 'Always'
    "let g:LanguageClient_completionPreferTextEdit = 0
    "let g:LanguageClient_preferredMarkupKind = ['plaintext']

    function SetLSPShortcuts()
        nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
        nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
        nnoremap <silent> <leader>lf :call LanguageClient#textDocument_formatting()<CR>
        nnoremap <silent> <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <silent> <leader>lx :call LanguageClient#textDocument_references()<CR>
        nnoremap <silent> <leader>la :call LanguageClient_workspace_applyEdit()<CR>
        nnoremap <silent> <leader>lc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
        nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
        nnoremap <silent> <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
        nnoremap <silent> <leader>lm :call LanguageClient_contextMenu()<CR>
        nnoremap <silent> <leader>gs :call LanguageClient#textDocument_signatureHelp()<CR>
        nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
        nnoremap <silent> <M-CR> :call LanguageClient#textDocument_codeAction()<CR>
    endfunction()

    augroup LSP
      autocmd!
      autocmd FileType java call SetLSPShortcuts()
    augroup END


" -----------------------------------------------------------------------------
" Deoplete config
" See :help deoplete-options for a complete list of options.
" -----------------------------------------------------------------------------

    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)

    " Use smartcase.
    call deoplete#custom#option('smart_case', v:true)

" -----------------------------------------------------------------------------
" Echodoc config
" echodoc can handle the function signatures displaying.
" When you accept a completion for a function with <c-y>, echodoc will display the function signature in the command line and highlight the argument position your cursor is in.
" echodoc#type controls where the documentation is displayed. Choose between: "echo", "signature", "virtual", "floating" or "popup"
" -----------------------------------------------------------------------------

    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'echo'
    "let g:echodoc#type = 'virtual'
    "let g:echodoc#type = 'floating'

" -----------------------------------------------------------------------------
" NeoSnippet config
" Use <C-k> to select-and-expand a snippet from the deoplete popup.
" Use <C-n> and <C-p> to select it.
" <C-k> can also be used to jump to the next field in the snippet.
" Use <Tab> to select the next field to fill in the snippet.
" -----------------------------------------------------------------------------

    let g:neosnippet#enable_complete_done = 1

    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    "imap <C-k> <Plug>(neosnippet_expand_or_jump)
    "smap <C-k> <Plug>(neosnippet_expand_or_jump)
    "xmap <C-k> <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    "imap <expr><TAB> pumvisible() ? "\<C-n>" :
    "    \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    "smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    "if has('conceal')
    "  set conceallevel=2 concealcursor=niv
    "endif

endif

