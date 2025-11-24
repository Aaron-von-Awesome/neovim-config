-- ==========================================================================================
--                    Customize Status Bar
-- ==========================================================================================

-- Left Side
vim.opt.statusline = ""
vim.opt.statusline = vim.opt.statusline + " %M"
vim.opt.statusline = vim.opt.statusline + " %y"
vim.opt.statusline = vim.opt.statusline + " %r"
vim.opt.statusline = vim.opt.statusline + " %F"

-- Right side
vim.opt.statusline = vim.opt.statusline + "%="
vim.opt.statusline = vim.opt.statusline + " %c:%l/%L"
vim.opt.statusline = vim.opt.statusline + " %p%%"
vim.opt.statusline = vim.opt.statusline + " [%n]"
