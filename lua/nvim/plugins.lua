-- ==========================================================================================
--              Install Plugins and Color Schemes via Nvim.Pack
-- ==========================================================================================

-------------------------------------------------
-- Core plugins
-------------------------------------------------
vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua.git" }) -- File Explorer
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim.git" })   -- Dependency for nvim-telescope
vim.pack.add({ "https://github.com/mason-org/mason.nvim.git" })    -- Package Manager for LSP, DAP, linters, and formatters
vim.pack.add(
  {
    "https://github.com/neovim/nvim-lspconfig.git",
    "https://github.com/mason-org/mason-lspconfig.nvim.git",
  }
) -- LSP

-------------------------------------------------
-- Debug Adapter Protocol (DAP)
-------------------------------------------------
vim.pack.add(
  {
    "https://github.com/mfussenegger/nvim-dap.git",
    "https://github.com/mfussenegger/nvim-dap-python.git",
    "https://github.com/nvim-neotest/nvim-nio.git",
    "https://github.com/rcarriga/nvim-dap-ui.git",
    "https://github.com/theHamsta/nvim-dap-virtual-text.git",
  }
)

-------------------------------------------------
-- Linters / Formatters
-------------------------------------------------
vim.pack.add({ "https://github.com/mfussenegger/nvim-lint.git" })     -- Linters
vim.pack.add({ "https://github.com/mhartington/formatter.nvim.git" }) -- Formatters

-------------------------------------------------
-- UI / Syntax
-------------------------------------------------
vim.pack.add(
  {
    "https://github.com/lukas-reineke/indent-blankline.nvim.git",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = "master" },
    "https://github.com/sheerun/vim-polyglot.git",
  }
)

-------------------------------------------------
-- Completion
-------------------------------------------------
vim.pack.add(
  {
    "https://github.com/hrsh7th/cmp-buffer.git",
    "https://github.com/hrsh7th/cmp-cmdline.git",
    "https://github.com/hrsh7th/cmp-nvim-lsp.git",
    "https://github.com/hrsh7th/cmp-nvim-lua.git",
    "https://github.com/hrsh7th/cmp-path.git",
    "https://github.com/hrsh7th/nvim-cmp.git",
    "https://github.com/onsails/lspkind.nvim.git", }
)
vim.pack.add(
  {
    "https://github.com/L3MON4D3/LuaSnip.git",
    "https://github.com/rafamadriz/friendly-snippets.git",
    "https://github.com/saadparwaiz1/cmp_luasnip.git",
  }
)

-------------------------------------------------
-- Utilities & Tools
-------------------------------------------------
vim.pack.add(
  {
    "https://github.com/benomahony/uv.nvim.git",
    "https://github.com/mbbill/undotree.git",
    "https://github.com/nvim-telescope/telescope.nvim.git",
    "https://github.com/voldikss/vim-floaterm.git",
  }
)

-------------------------------------------------
-- Color schemes
-------------------------------------------------
vim.pack.add({ "https://github.com/folke/tokyonight.nvim.git" })

-------------------------------------------------
-- Icons
-------------------------------------------------
vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons.git" })

-------------------------------------------------
-- Miscellaneous plugins
-------------------------------------------------
vim.pack.add(
  {
    "https://github.com/mracos/mermaid.vim.git",
    "https://github.com/euclio/vim-markdown-composer.git",
  }
)
