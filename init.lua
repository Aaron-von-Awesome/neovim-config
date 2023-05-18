-- ==========================================================================================
--                           Neovim Config File von Awesome
-- ==========================================================================================

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Install Plugins
require("nvim/plugins")

-- Customize Neovim
require("user/settings")

-- Custom Key Mappings
require("user/keymaps")

-- Treesitter
--   https://github.com/nvim-treesitter/nvim-treesitter
require("config/treesitter")

-- Mason - LSP servers, DAP servers, linters, and formatters
--   https://github.com/williamboman/mason.nvim
--   https://github.com/williamboman/mason-lspconfig.nvim
require("config/mason")

-- LSP Servers
require("config/lsp")

-- Autocommands
require("nvim/autocommands")

-- Customize Neovim Status Bar
require("nvim/status_bar")

-- Markdown Composer Configuration
require("config/markdown_composer")

-- Telescope Configuration
require("config/telescope")

-- Nvim-cmp Configuration
require("config/nvim_cmp")

-- Nvim-lint Configuration
require("config/nvim_lint")

-- LuaSnip Configuration
require("config/lua_snip")

-- Indent Blankline Configuration
require("config/indent_blankline")

-- Nvim Tree Configuration
require("config/nvim_tree")
