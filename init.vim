" ==========================================================================================
"                          Neovim Config File von Awesome
" ==========================================================================================

" Syntax Highlighting
syntax on

" Search Path
set path+=**

" Set Leader Key
let mapleader = " "
nnoremap <space> <nop>

" Browse Window Properties
let g:netrw_preview = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4

" netrw Tweak until the fix for the bug at adds a phantom <space> to
" the minus (-) key gets merged up stream: https://stackoverflow.com/a/58409216
nmap - <Plug>NetrwBrowseUpDir

" Buffer Settings
set hidden

" Automatically change to the directory of the open file
" set autochdir

" Sign Column Settings
set signcolumn=yes

" Show Line Number settings
"set number norelativenumber    "Setting absolute line numbers
set number relativenumber	      "Setting relative line numbers

" Show line under cursor
set cursorline

" Tab Options
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Search Options
" set nohlsearch
set ignorecase
set smartcase                   "If your search has an upper case character in it, then search will be case sensitive, else case insensitive
set inccommand=nosplit          "Show substitutions incrementally

" File History Settings
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Scrolling Options
set scrolloff=10                "Start scrolling the screen up or down when the cursor is 10 rows from the top or bottom

" Window Options
set splitbelow                  "Put horizontally split new windows below


" ----------------------------------------------------------
"                  Custom Key Bindings
" ----------------------------------------------------------

" Quick reload of init.vim file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Navigate between windows easier
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><tab> <c-^>

" Move lines or blocks of lines at once
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Shortcut for :noh
nnoremap <leader>nh :noh<CR>

" Open tree view for current file directory
nnoremap <leader>tv :wincmd v<bar> Ex <bar> vertical resize 35<CR>
nnoremap <leader>th :wincmd s<bar> Ex <bar> resize 25<CR>

" Return to Normal mode whilst in Insert mode using the Terminal
tnoremap <Esc> <C-\><C-n>

" Still need to be able to send <Esc> whilst using Terminal
tnoremap <A-[> <Esc>

" I keep typing Q
nnoremap Q <nop>

" Generate Graphviz custom key binding (TODO: How do I detect a dot file, and
" only allow this to run against a dot file?)
nnoremap <leader>ggv :!dot -T png % -o %:r.png<CR>
nnoremap <leader>vgv :!display %:r.png &<CR>

" Copy & Paste to/from system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Window Controls
nnoremap <A-Up> :vert resize +4<CR>
nnoremap <A-Down> :vert resize -4<CR>
nnoremap <C-Up> :resize +4<CR>
nnoremap <C-Down> :resize -4<CR>

" Spell Check
nnoremap <leader>ss :set spell<CR>
nnoremap <leader>sns :set nospell<CR>
" Find next spelling mistake
nnoremap <leader>sl ]s
" Find previous spelling mistake
nnoremap <leader>sh [s
" z= - Replace misspelled word
" zg - Good word: Add the word under the cursor to the dictionary
" zw - Woops! Undo and remove the word from the dictionary

" Word Wrap
nnoremap <leader>snw :set nowrap<CR>
nnoremap <leader>sw :set wrap<CR>


" -----------------------------------------------------------
"                        Status Bar
" -----------------------------------------------------------

" Left Side
set statusline=
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F
" Right side
set statusline+=%=
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
set statusline+=\ [%n]


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


    " Trigger `autoread` when files changes on disk
    " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
    " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

    " Notification after file change
    " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

augroup END
