-- ==========================================================================================
--                    Telescope Plugin Configuration
-- ==========================================================================================

vim.keymap.set("n", "<Leader>ff", ":lua require('telescope.builtin').find_files({hidden = true})<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fb", ":lua require('telescope.builtin').buffers()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", { noremap = true })
