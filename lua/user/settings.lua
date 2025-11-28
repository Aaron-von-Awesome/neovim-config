-- ==========================================================================================
--                        User Settings
-- ==========================================================================================

-- Set Leader Key
vim.g.mapleader = " "
vim.keymap.set("n", "<space>", "<nop>", { noremap = true })

-- Syntax Highlighting
vim.opt.syntax = "on"

-- Search Path
vim.opt.path = vim.opt.path + "**"

-- Ignore tags file in searches like vimgrep
vim.opt.wildignore = vim.opt.wildignore + "tags"

-- Colors/Color Schemes
vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight-night")

-- File Browsing Window properties
vim.g.netrw_preview = 1
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_browse_split = 4

-- Buffer Settings
vim.opt.hidden = true

-- Sign Column Settings
vim.opt.signcolumn = "yes"

-- Line Number Settings
vim.opt.number = true
vim.opt.relativenumber = false

-- Show line under cursor
vim.opt.cursorline = true

-- Highlight Cursor Column
vim.opt.cursorcolumn = true

-- Tab Options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search Options
--vim.opt.nohlsearch = true
vim.opt.ignorecase = true

--If your search has an upper case character in it,
--then search will be case sensitive, else case insensitive
vim.opt.smartcase = true

--Show substitutions incrementally
vim.opt.inccommand = "nosplit"

-- File History Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Scrolling Options
--Start scrolling the screen up or down when the cursor is 10 rows from the top or bottom
vim.opt.scrolloff = 10

-- Window Options
--Put horizontally split new windows below
vim.opt.splitbelow = true

-- Folding
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
