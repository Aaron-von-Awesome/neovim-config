-- ======================================================================
--                    Telescope Plugin Configuration
-- ======================================================================

vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files({hidden = true})<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fg", ":lua require('telescope.builtin').live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fb", ":lua require('telescope.builtin').buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').help_tags<CR>", { noremap = true })
