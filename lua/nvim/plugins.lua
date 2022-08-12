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
    "mbbill/undotree",
    "sheerun/vim-polyglot",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "kyazdani42/nvim-web-devicons",
    "neovim/nvim-lspconfig",
    "lukas-reineke/indent-blankline.nvim",
    "williamboman/mason-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-lint",
    "mhartington/formatter.nvim",
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
