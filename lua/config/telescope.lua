-- ======================================================================
--                    Telescope Plugin Configuration
-- ======================================================================

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
