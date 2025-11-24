-- ==========================================================================================
--                      nvim-tree Plugin Configuration
-- ==========================================================================================

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 45,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})
