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
    "azure_pipelines_ls",
    "bashls",
    "dockerls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "ts_ls",
    "yamlls"
  },
  automatic_installation = true
})
