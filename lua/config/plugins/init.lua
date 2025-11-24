-- ==========================================================================================
--                          Configure Plugins - init.lua
-- ==========================================================================================

-- Treesitter
--   https://github.com/nvim-treesitter/nvim-treesitter
require("config.plugins.treesitter")

-- Mason - LSP servers, DAP servers, linters, and formatters
--   https://github.com/williamboman/mason.nvim
--   https://github.com/williamboman/mason-lspconfig.nvim
require("config.plugins.mason")

-- LSP Servers
require("config.plugins.lsp")

-- Markdown Composer Configuration
require("config.plugins.markdown_composer")

-- Telescope Configuration
require("config.plugins.telescope")

-- Nvim-cmp Configuration
require("config.plugins.nvim_cmp")

-- Nvim-dap Configuration
require("config.plugins.nvim_dap")

-- Nvim-lint Configuration
require("config.plugins.nvim_lint")

-- LuaSnip Configuration
require("config.plugins.lua_snip")

-- Indent Blankline Configuration
require("config.plugins.indent_blankline")

-- Nvim Tree Configuration
require("config.plugins.nvim_tree")

-- uv.nvim Configuration
require("config.plugins.uv")
