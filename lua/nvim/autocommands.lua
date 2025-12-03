-- ==========================================================================================
--                       Neovim Autocommands
-- ==========================================================================================
-- TODO: still have no idea what these are, just coping and pasting :-(

local autocmd = vim.api.nvim_create_autocmd

-- Trim white space & Format with LSP on save
autocmd({ "BufWritePre" }, {
  pattern = "*",
  callback = function()
    -- Trim trailing spaces **but keep pure‑blank lines**
    vim.cmd([[%s/\s\+$//e]])

    -- Run the LSP formatter asynchronously
    vim.lsp.buf.format { async = true }
  end,
})

autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
