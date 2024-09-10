-- ======================================================================
--                      Mason Plugin Configuration
-- ======================================================================

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
    "ansiblels@0.5.0",
    "dockerls",
    "dotls",
    "gopls",
    "html",
    "lua_ls",
    "pyright",
    "ts_ls",
    "yamlls" },
  automatic_installation = true
})
