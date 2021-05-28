" ==========================================================================================
"                          Neovim Config File von Awesome
" ==========================================================================================

" Syntax Highlighting
syntax on

" Search Path
set path+=**

" Set Leader Key
let mapleader = " "

" Browse Window Properties
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Buffer Settings
set hidden

" Automatically change to the directory of the open file
set autochdir

" Sign Column Settings
set signcolumn=yes

" Show Line Number settings
"set number norelativenumber    "Setting absolute line numbers
set number relativenumber	    "Setting relative line numbers

" Show line under cursor
set cursorline

" Tab Options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Search Options
" set nohlsearch
set ignorecase
set smartcase                   "If your search has an upper case character in it, then search will be case sensitive, else case insensitive

" File History Settings
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Scrolling Options
set scrolloff=10                "Start scolling the screen up or down when the cursor is 10 rows from the top or bottom

" ----------------------------------------------------------
"                  Custom Key Bindings
" ----------------------------------------------------------

" Navigate between windows easier
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Move lines or blocks of lines at once
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" -----------------------------------------------------------
"                  Magical Auto Commands
" -----------------------------------------------------------

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup VON_AWESOME
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
