-- ==========================================================================================
--                      Mason Plugin Configuration
-- ==========================================================================================

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "ansiblels",
    "bashls",
    "dockerls",
    "html",
    "jsonls",
    "lua_ls",
    "pylsp",
    "ts_ls",
    "yamlls"
  },
  automatic_installation = true
})
