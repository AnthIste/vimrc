set rtp+=~/.vim/bundle/vundle/
filetype off
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'rking/ag.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'adamlowe/vim-slurper'
Bundle 'kien/ctrlp.vim'
Bundle 'slim-template/vim-slim'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ddollar/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'jwhitley/vim-matchit'
Bundle 't9md/vim-ruby-xmpfilter'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'
Bundle 'csexton/trailertrash.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'textobj-user'
Bundle 'textobj-rubyblock'

" autoindent with two spaces, always expand tabs
autocmd BufNewFile,BufReadPost * set ai ts=2 sw=2 sts=2 et

" check for external file changes
autocmd CursorHold,CursorMoved,BufEnter * checktime

syntax on
let g:Powerline_symbols = 'fancy'
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:ctrlp_max_height = 0
let g:syntastic_check_on_open=1
let NERDTreeShowHidden=0

filetype plugin indent on

" Color configuration
set background=dark

if has("gui_running")
  colorscheme solarized

  set guioptions=agimlr
  set lines=999
  set columns=999
else
  "set t_Co=256
  colorscheme darkblue
endif

set splitright
set splitbelow

if has('mouse_sgr')
  set ttymouse=sgr
endif

if $TMUX != ""
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" line highlighting
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=233

set incsearch
set hlsearch
noh " clear the initial highlight after sourcing
set ignorecase smartcase
set number
set relativenumber
set scrolloff=5
set mouse=a
set laststatus=2 " always show the status bar
set nocompatible
set noswapfile
set nobackup
set nowritebackup
set nowrap
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" set clipboard=unnamed

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

set showmatch

set wildmenu
set wildmode=longest,list

let g:yankring_replace_n_pkey = '<C-;>'

let mapleader=","
inoremap <c-s> <esc>:w<CR>
map <c-s> <c-c>:w<CR>
cmap w!! %!sudo tee > /dev/null %

" search highlighting
nmap <silent> <leader>ds :nohlsearch<CR>

" toggle relative numbering
noremap <silent> <leader>n :exec &rnu ? "se nu" : "se rnu"<CR>

" navigate panes with <c-hjkl>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

map <F3> :NERDTreeTabsToggle<CR>
map <leader>ff :NERDTreeFind<CR>

" xmpfilter
map <F10> <Plug>(xmpfilter-run)
map <F9> <Plug>(xmpfilter-mark)

" paste, fix indentation and clear the mark by default
nnoremap p p=`]`<esc>

map <leader>bu :!bundle update<space>

nmap <leader>bx :!bundle exec<space>
map <leader>vbi :BundleInstall<CR>
map <leader>vbu :BundleUpdate<CR>

map <leader>vi :tabe ~/.vimrc<CR>
"map <leader>vs :source ~/.vimrc<CR>

map <silent> <leader>gs :Gstatus<CR>/not staged<CR>/modified<CR>
map <leader>gc :Gcommit<CR>

map <leader>bn :bn<CR>
map <leader>bp :bp<CR>

" tab controls
map <leader>tp :tabp<CR>
map <leader>tn :tabn<CR>
map <leader>tN :tabnew<CR>
map <leader>tx :tabclose<CR>

" split controls
map <leader>vv :vsplit<CR>
map <leader>vs :split<CR>

" file controls
noremap <leader>q :q<CR>
noremap <leader>X :qall<CR>

map <leader>= <C-w>=

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" tab for equals
map <leader>te :Tab/^[^=]*\zs/l0l1<CR>
" tab for hash/json syntax
map <leader>th :Tab/^[^:]*\zs/l0l1<CR>

" pane management
"map <leader>mh :wincmd H<CR>
"map <leader>mj :wincmd J<CR>
"map <leader>mk :wincmd K<CR>
"map <leader>ml :wincmd L<CR>

" flip left and right panes
map <leader>mm :NERDTreeTabsClose<CR>:wincmd l<CR>:wincmd H<CR>:NERDTreeTabsOpen<CR>:wincmd l<CR><C-W>=

" j and k navigate through wrapped lines
nmap k gk
nmap j gj

command! Q q " Bind :Q to :q
command! Qall qall

command! W w
command! Wa wall

" CtrlPTag
let g:ctrlp_map = '<c-p>'
nnoremap <leader>. :CtrlPTag<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Source: https://github.com/thoughtbot/dotfiles/blob/master/vimrc
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if has("autocmd")
  " Also load indent files, to automatically do language-dependent indenting.

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Never wrap slim files
  autocmd FileType slim setlocal textwidth=0

  autocmd BufWritePre * :%s/\s\+$//e

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")
