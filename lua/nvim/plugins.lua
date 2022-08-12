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

  -- Plugins
  use {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "kyazdani42/nvim-web-devicons",
    "lukas-reineke/indent-blankline.nvim",
    "mbbill/undotree",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-lint",
    "mhartington/formatter.nvim",
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "sheerun/vim-polyglot",
    "williamboman/mason-lspconfig",
    "williamboman/mason.nvim"
  }

  -- Color Schemes
  use "tomasiser/vim-code-dark"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
