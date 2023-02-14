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
    "yamlls",
    "lua_ls",
    "dotls",
    "pyright",
    "gopls",
    "tsserver",
    "html",
    "dockerls" },
  automatic_installation = true
})
