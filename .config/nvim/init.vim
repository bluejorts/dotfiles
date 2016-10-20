function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

call plug#begin('~/.vim/plugged')
  Plug 'flazz/vim-colorschemes'
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'

  Plug 'vim-airline/vim-airline'
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'

  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'slim-template/vim-slim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'tpope/vim-cucumber'
  Plug 'othree/yajs.vim'

  Plug 'elixir-lang/vim-elixir'
  Plug 'thinca/vim-ref'
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

  Plug 'maxmellon/vim-jsx-pretty'

  Plug 'sirtaj/vim-openscad'
call plug#end()

" ------ General Config ------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set clipboard=unnamed
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
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
nnoremap <C-n> :call NumberToggle()<cr>

" ------ CtrlP ------

let g:ctrlp_map = ',f'
let g:ctrlp_user_command = 'pt %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .DS_Store
      \ --ignore .bundle
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_use_caching = 0

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
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()
