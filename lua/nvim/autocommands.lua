-- ======================================================================
--                       Neovim Autocommands
-- ======================================================================
-- TODO: still have no idea what these are, just coping and pasting :-(

local augroup = vim.api.nvim_create_augroup
VonAwesomeGroup = augroup('VonAwesome', {})

local autocmd = vim.api.nvim_create_autocmd

-- Trim white space
autocmd({ "BufWritePre" }, {
  group = VonAwesomeGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source lua/nvim/plugins.lua | PackerCompile
  augroup end
]])
