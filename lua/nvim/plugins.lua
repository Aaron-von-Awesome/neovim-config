-- ==========================================================================================
--              Install Plugins and Color Schemes via Packer
-- ==========================================================================================

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
  vim.cmd [[packadd packer.nvim]]
end


return require("packer").startup(function(use)
  -------------------------------------------------
  -- Core plugins
  -------------------------------------------------
  use { "wbthomason/packer.nvim" }                                -- Packer can manage itself
  use { "nvim-tree/nvim-tree.lua" }                               -- File Explorer
  use { "nvim-lua/plenary.nvim" }                                 -- Helper Plugins
  use { "williamboman/mason.nvim" }                               -- Package Manager for LSP, DAP, linters, and formatters
  use { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig" } -- LSP

  -------------------------------------------------
  -- Debug Adapter Protocol (DAP)
  -------------------------------------------------
  use {
    "mfussenegger/nvim-dap",
    requires = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
  }

  -------------------------------------------------
  -- Linters / Formatters
  -------------------------------------------------
  use { "mfussenegger/nvim-lint" }     -- Linters
  use { "mhartington/formatter.nvim" } -- Formatters

  -------------------------------------------------
  -- UI / Syntax
  -------------------------------------------------
  use {
    "lukas-reineke/indent-blankline.nvim",
    "nvim-treesitter/nvim-treesitter",
    "sheerun/vim-polyglot",
  }

  -------------------------------------------------
  -- Completion
  -------------------------------------------------
  use {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "onsails/lspkind.nvim",
  }
  use { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" }

  -------------------------------------------------
  -- Utilities & Tools
  -------------------------------------------------
  use {
    "benomahony/uv.nvim",
    "mbbill/undotree",
    "nvim-telescope/telescope.nvim",
    "voldikss/vim-floaterm",
  }

  -------------------------------------------------
  -- Color schemes
  -------------------------------------------------
  use { "tomasiser/vim-code-dark" }
  use {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }

  -------------------------------------------------
  -- Icons
  -------------------------------------------------
  use { "kyazdani42/nvim-web-devicons" }

  -------------------------------------------------
  -- Miscellaneous plugins
  -------------------------------------------------
  use { "mracos/mermaid.vim", "euclio/vim-markdown-composer" }

  -------------------------------------------------
  -- Auto‑run packer sync after first install
  -------------------------------------------------
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
