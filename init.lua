-- ==========================================================================================
--                           Neovim Config File von Awesome
-- ==========================================================================================

-- -----------------------------------------------------------
--                      Requires
-- -----------------------------------------------------------


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
vim.opt.syntax = true

-- Search Path
vim.opt.path = vim.opt.path + '**'

-- Ignore tags file in searches like vimgrep
set wildignore+=tags

-- Colors/Color Schemes
vim.opt.termguicolors = true
vim.g.codedark_conservative = 1
vim.opt.colorscheme = 'codedark'

-- Set indent character for indent-blankline.nvim plugin
vim.g.indent_blankline_char = '⦙'

-- File Browsing Window properties
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


-- ----------------------------------------------------------
--                  Custom Key Bindings
-- ----------------------------------------------------------

-- Open tree view for current file directory
vim.api.nvim_set_keymap('n', '<leader>tv', ':wincmd v<bar> Ex <bar> vertical resize 35<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>th', ':wincmd s<bar> Ex <bar> resize 25<CR>', {noremap = true})



