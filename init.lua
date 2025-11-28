-- ==========================================================================================
--                           Neovim Config File von Awesome
-- ==========================================================================================

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Install Plugins
require("nvim.plugins") --nvim/plugins.lua

-- Configure Plugins
require("config.plugins") --config/plugins/init.lua

-- Customize Neovim
require("user.settings") --user/settings.lua

-- Custom Key Mappings
require("user.keymaps") --user/keymaps.lua

-- Customize Neovim Status Bar
require("nvim.status_bar") --nvim/status_bar.lua

-- Autocommands
require("nvim.autocommands") --nvim/autocommands.lua
