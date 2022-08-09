-- ==========================================================================================
--                           Neovim Config File von Awesome
-- ==========================================================================================

-- -----------------------------------------------------------
--                      Requires
-- -----------------------------------------------------------
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = { "ansiblels@0.5.0", "yamlls" },
    automatic_installation = true
})

require("lspconfig").ansiblels.setup({
    on_attach = function()
       vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    end,
})
require("lspconfig").yamlls.setup({
    on_attach = function()
       vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    end,
})


-- -----------------------------------------------------------
--                  Magical Auto Commands
-- -----------------------------------------------------------

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
    group = VonAwesomeGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})


-- -----------------------------------------------------------
--                      General Settings
-- -----------------------------------------------------------

-- Set Leader Key
vim.g.mapleader = ' '
vim.api.nvim_set_keymap( 'n', '<space>', '<nop>', {noremap = true})

-- Syntax Highlighting
vim.opt.syntax = 'on'

-- Search Path
vim.opt.path = vim.opt.path + '**'

-- Ignore tags file in searches like vimgrep
vim.opt.wildignore = vim.opt.wildignore + 'tags'

-- Colors/Color Schemes
vim.opt.termguicolors = true
vim.g.codedark_conservative = 1
vim.cmd [[colorscheme codedark]]

-- Set indent character for indent-blankline.nvim plugin
vim.g.indent_blankline_char = '⦙'

-- File Browsing Window properties
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Buffer Settings
vim.opt.hidden = true

-- Sign Column Settings
vim.opt.signcolumn = 'yes'

-- Line Number Settings
vim.opt.number.relativenumber = true

-- Show line under cursor
vim.opt.cursorline = true

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
vim.opt.inccommand = 'nosplit'

-- File History Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = '~/.vim/undodir'
vim.opt.undofile = true

-- Scrolling Options
--Start scrolling the screen up or down when the cursor is 10 rows from the top or bottom
vim.opt.scrolloff = 10

-- Window Options
--Put horizontally split new windows below
vim.opt.splitbelow = true


-- ----------------------------------------------------------
--                  Custom Key Bindings
-- ----------------------------------------------------------
-- vim.api.nvim_set_keymap('<mode>', '<keys>', '<actions>', {<options>})

-- Quick reload of init.lua
vim.api.nvim_set_keymap('n', '<leader><CR>', ':luafile ~/.config/nvim/init.lua<CR>', {noremap = true})

-- Navigate between windows easier
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><tab>', '<c-^>', {noremap = true})

-- Move lines of blocks of lines at once
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})

-- Open tree view for current file directory
vim.api.nvim_set_keymap('n', '<leader>tv', ':wincmd v<bar> Ex <bar> vertical resize 35<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>th', ':wincmd s<bar> Ex <bar> resize 25<CR>', {noremap = true})

-- Return to Normal mode whilst in Insert mode using the Terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- Still need to be able to send <Esc> whilst using Terminal
vim.api.nvim_set_keymap('t', '<A-[>', '<Esc>', {noremap = true})

-- I keep typing Q
vim.api.nvim_set_keymap('n', 'Q', '<nop>', {noremap = true})

-- Generate Graphviz custom key binding (TODO: How do I detect a dot file, and
-- only allow this to run against a dot file?)
vim.api.nvim_set_keymap('n', '<leader>ggv', ':w<CR>:!dot -T png % -o %:r.png<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vgv', ':!display %:r.png &<CR>', {noremap = true})

-- Copy & Paste to/from system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>Y', 'gg"+yG', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {noremap = true})

-- Copy relative path
vim.api.nvim_set_keymap('n', '<leader>cf', ':let @+=expand("%")<CR>', {noremap = true})

-- Copy absolute path
vim.api.nvim_set_keymap('n', '<leader>cF', ':let @+=expand("%:p")<CR>', {noremap = true})

-- Window Controls
vim.api.nvim_set_keymap('n', '<A-Up>', ':lua vim.cmd[[vert resize +5]]<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-Down>', ':lua vim.cmd[[vert resize -5]]<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Up>', ':lua vim.cmd[[resize +5]]<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':lua vim.cmd[[resize -5]]<CR>', {noremap = true})

-- Spell Check
vim.api.nvim_set_keymap('n', '<leader>ss', ':lua vim.opt.spell = true<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>sns', ':lua vim.opt.spell = false<CR>', {noremap = true})

-- Find next spelling mistake
vim.api.nvim_set_keymap('n', '<leader>sl', ']s', {noremap = true})
-- Find previous spelling mistake
vim.api.nvim_set_keymap('n', '<leader>sh', '[s', {noremap = true})
-- z= - Replace misspelled word
-- zg - Good word: Add the word under the cursor to the dictionary
-- zw - Woops! Undo and remove the word from the dictionary

-- Word Wrap
vim.opt.wrap = false
vim.api.nvim_set_keymap('n', '<leader>snw', ':lua vim.opt.wrap = false<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>sw', ':lua vim.opt.wrap = true<CR>', {noremap = true})

-- Quickfix List Navigation
vim.api.nvim_set_keymap('n', '<C-j>', ':cnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':cprev<CR>', {noremap = true})

-- -----------------------------------------------------------
--                        Status Bar
-- -----------------------------------------------------------

-- Left Side
vim.opt.statusline = ''
vim.opt.statusline = vim.opt.statusline + '\\ %M'
vim.opt.statusline = vim.opt.statusline + '\\ %y'
vim.opt.statusline = vim.opt.statusline + '\\ %r'
vim.opt.statusline = vim.opt.statusline + '\\ %F'

-- Right side
vim.opt.statusline = vim.opt.statusline + '%='
vim.opt.statusline = vim.opt.statusline + '\\ %c:%l/%L'
vim.opt.statusline = vim.opt.statusline + '\\ %p%%'
vim.opt.statusline = vim.opt.statusline + '\\ [%n]'

-- -----------------------------------------------------------
--                       Markdown Composer Options
-- -----------------------------------------------------------
vim.g.markdown_composer_autostart = 0


-- -----------------------------------------------------------
--                       Telescope
-- -----------------------------------------------------------
-- Find files using Telescope

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true})
