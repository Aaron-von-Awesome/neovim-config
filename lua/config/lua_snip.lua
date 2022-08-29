-- ======================================================================
--                      LuaSnip Plugin Configuration
-- ======================================================================

-- VsCode-like Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Load Custom Snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })

-- Key Mappings
vim.keymap.set("i", "<S-Tab>", ":lua require(\"luasnip\").jump(-1)<CR>", { noremap = true, silent = true })

vim.keymap.set("s", "<Tab>", ":lua require(\"luasnip\").jump(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("s", "<S-Tab>", ":lua require(\"luasnip\").jump(-1)<CR>", { noremap = true, silent = true })
