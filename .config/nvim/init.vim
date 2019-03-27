call plug#begin('~/.vim/plugged')
  Plug 'flazz/vim-colorschemes'
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim'

  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'jiangmiao/auto-pairs'

  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'slim-template/vim-slim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'tpope/vim-cucumber'
  Plug 'othree/yajs.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'vim-scripts/x12-syntax'
  
  Plug 'kien/ctrlp.vim'
  Plug 'nazo/pt.vim'

  Plug 'Quramy/vim-js-pretty-template'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/tsuquyomi', {'do' : 'make'}

  Plug 'elixir-lang/vim-elixir'
  Plug 'thinca/vim-ref'
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

  Plug 'maxmellon/vim-jsx-pretty'

  Plug 'sirtaj/vim-openscad'

  Plug 'easymotion/vim-easymotion'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  "Plug 'uplus/deoplete-solargraph'

  " dumb bullshit starts here
  Plug 'fszymanski/deoplete-emoji'
call plug#end()

" ------ Language Servers ------
" let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 
" }

" ------ General Config ------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme dracula
color dracula

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set clipboard=unnamed
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set relativenumber
set wmh=0
let mapleader = ","
" Reload files changed outside vim
set autoread
" Extend % functionality
runtime macros/matchit.vim
" Search is only case sensitive if it includes a CAPITAL letter
set ignorecase 
set smartcase
" Actually do title
set title
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
" Use the mouse like a filthy scrub
set mouse=a

nmap <leader>d :NERDTreeToggle<cr>
nmap <leader>w :bnext<cr>
nmap <leader>q :bprev<cr>
nmap <leader><leader>q :Bclose<cr>
nmap <leader>s :split<cr>
nmap <leader>v :vsplit<cr>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ------ CtrlP ------

nmap <leader>f :CtrlP<CR>

" ------ Deoplete ------

let g:deoplete#enable_at_startup = 1

" ------ Airline ------

let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" ------ Syntastic ------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------ Typescript ------

" QuickFix window with compile errors on :make
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Syntax highlighting on HTML templates inside .ts files
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

" Syntastic integration for Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" ------ Typescript ------
autocmd BufNewFile,BufRead *.x12 set ft=x12


" Highlight words to avoid in tech writing
" =======================================
"
"   obviously, basically, simply, of course, clearly,
"   just, everyone knows, However, So, easy

"   http://css-tricks.com/words-avoid-educational-writing/

highlight TechWordsToAvoid ctermbg=red ctermfg=white

function MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

autocmd FileType markdown call MatchTechWordsToAvoid()
