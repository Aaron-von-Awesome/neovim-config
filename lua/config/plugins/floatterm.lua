-- ==========================================================================================
--                   Floating Terminal Plugin Configuration
-- ==========================================================================================


-------------------------------------------------
-- Floater Window Settings
-------------------------------------------------
vim.g.floaterm_height = 0.9
vim.g.floaterm_width  = 0.9

-------------------------------------------------
-- Keymaps
-------------------------------------------------
local opts            = { noremap = true }

vim.keymap.set("n", "<Leader>ts", ":FloatermNew<CR>", opts)
vim.keymap.set("n", "<Leader>tp", ":FloatermPrev<CR>", opts)
vim.keymap.set("n", "<Leader>tn", ":FloatermNext<CR>", opts)
vim.keymap.set("n", "<Leader>tt", ":FloatermToggle<CR>", opts)


-- Added for Floating Terminal window that will run a Python script
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.api.nvim_set_keymap("n", "<Leader>tr", ":w<CR>:FloatermNew --autoclose=0 python %<CR>",
            { noremap = true, silent = true })
    end
})
