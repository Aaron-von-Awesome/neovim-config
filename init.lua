-- ==========================================================================================
--                           Neovim Config File von Awesome
-- ==========================================================================================

-- Install Plugins
require("nvim/plugins")

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

-- Customize Neovim
require("user/settings")

-- Custom Key Mappings
require("user/keymaps")

-- Customize Neovim Status Bar
require("nvim/status_bar")

-- Markdown Composer Configuration
require("config/markdown_composer")

-- Telescope Configuration
require("config/telescope")

-- Nvim-cmp Configuration
require("config/nvim_cmp")

-- LuaSnip Configuration
require("config/lua_snip")

-- Indent Blankline Configuration
require("config/indent_blankline")
