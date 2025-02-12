-- ======================================================================
--                      LSP Servers Configuration
-- ======================================================================

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>;", ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
end

-- Need for using nvim-cmp Plugin
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- --------------------------------------------------------
--                      Ansible
-- --------------------------------------------------------
require("lspconfig").ansiblels.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- --------------------------------------------------------
--                      YAML
-- --------------------------------------------------------
require("lspconfig").yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- --------------------------------------------------------
--                      Lua
-- --------------------------------------------------------
require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` and `use` global
        globals = { 'vim', 'use' },
      },
    },
  }
})

-- --------------------------------------------------------
--                      dot Graphviz
-- --------------------------------------------------------
require("lspconfig").dotls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- --------------------------------------------------------
--                      Python
-- --------------------------------------------------------
require("lspconfig").pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- --------------------------------------------------------
--                      JavaScript
-- --------------------------------------------------------
require("lspconfig").ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- --------------------------------------------------------
--                      HTML
-- --------------------------------------------------------
require("lspconfig").html.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- --------------------------------------------------------
--                      Dockerfile
-- --------------------------------------------------------
require("lspconfig").dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- --------------------------------------------------------
--                      JSON
-- --------------------------------------------------------
require("lspconfig").jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})
