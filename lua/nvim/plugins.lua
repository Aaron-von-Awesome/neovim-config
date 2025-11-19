-- ======================================================================
--              Install Plugins and Color Schemes via Packer
-- ======================================================================

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
  -- ---------------- --
  -- Add plugins here --
  -- ---------------- --

  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- File Explorer
  use "nvim-tree/nvim-tree.lua"

  -- Helper Plugins
  use "nvim-lua/plenary.nvim"

  -- Package Manager for LSP, DAP, linters, and formatters
  use "williamboman/mason.nvim"

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig"
  }

  -- DAP
  use "mfussenegger/nvim-dap"

  -- Linters
  use "mfussenegger/nvim-lint"

  -- Formatters
  use "mhartington/formatter.nvim"

  -- Syntactic Sugar
  use {
    "lukas-reineke/indent-blankline.nvim",
    "nvim-treesitter/nvim-treesitter",
    "sheerun/vim-polyglot"
  }

  -- Completion Plugins
  use {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "onsails/lspkind.nvim"
  }

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip"
  }

  -- Utilities & Tools
  use {
    "benomahony/uv.nvim",
    "mbbill/undotree",
    "nvim-telescope/telescope.nvim"
  }

  -- Color Schemes
  use {
    "tomasiser/vim-code-dark"
  }
  use {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Other
  use "mracos/mermaid.vim"
  use "euclio/vim-markdown-composer"


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
