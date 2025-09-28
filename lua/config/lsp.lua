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
vim.lsp.config("ansiblels", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml", "yml", "ansible" },
  single_file_support = false
})
vim.lsp.enable("ansiblels")

-- --------------------------------------------------------
--                      YAML
-- --------------------------------------------------------
vim.lsp.config("yamlls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      format = { enable = false }
    }
  }
})
vim.lsp.enable("yamlls")

-- --------------------------------------------------------
--                      Lua
-- --------------------------------------------------------
vim.lsp.config("lua_ls", {
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
vim.lsp.enable("lua_ls")

-- --------------------------------------------------------
--                      Python
-- --------------------------------------------------------
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.enable("pyright")

-- --------------------------------------------------------
--                      JavaScript
-- --------------------------------------------------------
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.enable("ts_ls")

-- --------------------------------------------------------
--                      HTML
-- --------------------------------------------------------
vim.lsp.config("html", {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.enable("html")

-- --------------------------------------------------------
--                      Dockerfile
-- --------------------------------------------------------
vim.lsp.config("dockerls", {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.enable("dockerls")

-- --------------------------------------------------------
--                      JSON
-- --------------------------------------------------------
vim.lsp.config("jsonls", {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.enable("jsonls")
