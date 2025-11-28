-- ==========================================================================================
--                   Floating Terminal Plugin Configuration
-- ==========================================================================================


-------------------------------------------------
-- Floater Window Settings
-------------------------------------------------
vim.g.floaterm_height        = 0.9
vim.g.floaterm_width         = 0.9

-------------------------------------------------
-- Keymaps
-------------------------------------------------
vim.g.floaterm_keymap_new    = "<Leader>ts"
vim.g.floaterm_keymap_prev   = "<Leader>tp"
vim.g.floaterm_keymap_next   = "<Leader>tn"
vim.g.floaterm_keymap_toggle = "<Leader>tt"


-- Added for Floating Terminal window that will run a Python script
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.api.nvim_set_keymap("n", "<Leader>tr", ":w<CR>:FloatermNew --autoclose=0 python %<CR>",
            { noremap = true, silent = true })
    end
})
