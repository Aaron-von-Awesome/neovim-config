-- ==========================================================================================
--                       Neovim Autocommands
-- ==========================================================================================
-- TODO: still have no idea what these are, just coping and pasting :-(

local augroup = vim.api.nvim_create_augroup
VonAwesomeGroup = augroup("VonAwesome", {})

local autocmd = vim.api.nvim_create_autocmd

-- Trim white space & Format with LSP on save
autocmd({ "BufWritePre" }, {
  group = VonAwesomeGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e | lua vim.lsp.buf.format({ async = true })",
})

autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Added for Floating Terminal Plugin
autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_set_keymap("n", "<F5>", ":w<CR>:FloatermNew --autoclose=0 python %<CR>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap("i", "<F5>", "<ESC>:w<CR>:FloatermNew --autoclose=0 python %<CR>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>tr", ":w<CR>:FloatermNew --autoclose=0 python %<CR>",
      { noremap = true, silent = true })
  end
})

-- Used for Packer
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source lua/nvim/plugins.lua | PackerCompile
  augroup end
]])
