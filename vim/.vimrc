" =============================================================================
"       VIM-PLUG SETTINGS
" =============================================================================

call plug#begin('~/.vim/plugged')

Plug 'baskerville/bubblegum'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'tikhomirov/vim-glsl', {'for': 'glsl'}
Plug 'cespare/vim-toml', {'for': 'toml'}

Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" =============================================================================
"       VIM SETTINGS
" =============================================================================

" Nobody cares about vi compatibility.
set nocompatible

" Filetype detection, plugins, and indenting.
filetype plugin indent on

" Hybrid line numbers.
"set relativenumber
set number

" Tabbing options.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Syntax highlighting options.
syntax on
set background=dark
set synmaxcol=2048

" Color scheme.
" silent! ensures that it doesn't complain if it isn't installed yet
silent! colorscheme bubblegum-256-dark

" Highlight current line, but only in the active window.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Search/find options.
set wrapscan
set ignorecase
set smartcase
set hlsearch
set incsearch
set path=.,/usr/include/**,/usr/local/include/**

" Use forward slashes in paths regardless of the OS.
set shellslash

" Allow backspacing over indents, end-of-line, and the start of insert.
set backspace=indent,eol,start

" Let the cursor go into invalid places.
set virtualedit=all

" Allow hidden buffers so unsaved buffers can go in the background.
set hidden

" Use a $ to mark the end of a word when changing it.
set cpoptions=cesB$

" Status line options (let airline handle it).
set laststatus=2

" Lazy redraw for efficiency.
set lazyredraw

" Show the command helper and current mode.
set showcmd
set showmode

" Multi-key macro timeout.
set timeoutlen=750

" Amount of history to keep around.
set history=100

" Keep some context around where we're scrolling.
set scrolloff=5
set sidescrolloff=10

" Completion options.
set wildmenu
set complete=.,w,b,t,i
set showfulltag
set tags=./tags,tags

" Various line wrapping and line width settings.
set nowrap
set colorcolumn=81
highlight ColorColumn ctermbg=236

" Fillchars and folding are dumb.
set fillchars=""
set nofoldenable

" =============================================================================
"       KEY MAPPINGS
" =============================================================================
" Thanks to Derek Wyatt for a bunch of these!

" Toggle paste mode.
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" Turn off highlight search.
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" Toggle text wrapping.
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Maps to make handling windows a bit easier.
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -5<CR>
noremap <silent> <C-F10> :resize +4<CR>
noremap <silent> <C-F11> :resize -4<CR>
noremap <silent> <C-F12> :vertical resize +5<CR>

" Map CTRL-E to do what ',' used to do.
nnoremap <c-e> ,
vnoremap <c-e> ,

" Edit the vimrc file.
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier.
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Highlight all instances of the current word under the cursor.
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Search the current file for what's currently in the search register and
" display matches.
nmap <silent> ,gs
     \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches.
nmap <silent> ,gw
     \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches.
nmap <silent> ,gW
     \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Swap two words.
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='.
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<CR>

" Delete all buffers.
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<CR>

" =============================================================================
"       NERD TREE SETTINGS
" =============================================================================

" Open/close NERD Tree with F2.
nmap <F2> :NERDTreeToggle<CR>
nmap <S-F2> :NERDTreeClose<CR>

" =============================================================================
"       EASY MOTION SETTINGS
" =============================================================================

" Rather than pollute the whole keyspace, use ,m as the trigger.
let g:EasyMotion_leader_key=',m'

" =============================================================================
"       INDENTLINE SETTINGS
" =============================================================================

" Use soft gray color.
let g:indentLine_color_term = 238

" Make them a solid bar.
let g:indentLine_char = '│'

" =============================================================================
"       AIRLINE SETTINGS
" =============================================================================

" Display buffers in the tab line.
let g:airline#extensions#tabline#enabled = 1

" Use Powerline patched fonts.
let g:airline_powerline_fonts = 1

" Use base16_default theme (tomorrow has broken highlights).
let g:airline_theme='bubblegum'

" =============================================================================
"       STARTIFY SETTINGS
" =============================================================================

" The order sections are displayed.
let g:startify_list_order = [
  \ ['   SESSIONS'],
  \ 'sessions',
  \ ['   MRU CWD'],
  \ 'dir',
  \ ['   MRU FILES'],
  \ 'files',
  \ ['   BOOKMARKS'],
  \ 'bookmarks'
  \ ]

" The number of files to list.
let g:startify_files_number = 5

" Automatically save sessions before quitting.
let g:startify_session_persistence = 1

" Delete buffers when loading a new session.
let g:startify_session_delete_buffers = 1

" =============================================================================
"       CTRL-P SETTINGS
" =============================================================================

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" =============================================================================
"       YOUCOMPLETEME SETTINGS
" =============================================================================

" Turn off the preview window on completions, it's annoying and not helpful.
let g:ycm_autoclose_preview_window_after_completion = 1

" =============================================================================
"       FILETYPE SETTINGS
" =============================================================================

" ROS .launch files are XML
au BufNewFile,BufRead *.launch set filetype=xml

" ROS .rosinstall files are YAML
au BufNewFile,BufRead *.rosinstall set filetype=yaml

" Bazel WORKSPACE, BUILD, and .bzl files are Python
au BufNewFile,BufRead WORKSPACE set filetype=python
au BufNewFile,BufRead BUILD* set filetype=python
au BufNewFile,BufRead *.bzl set filetype=python
