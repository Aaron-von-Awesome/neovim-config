-- ==========================================================================================
--                                LSP Servers Configuration
-- ==========================================================================================

-- -----------------------------------------------------------------
--  Helper: on_attach (runs after a server attaches to a buffer)
-- -----------------------------------------------------------------
local on_attach = function(client, bufnr)
  -- Enable LSP‑based completion
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Navigation & actions -------------------------------------------------
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", ";", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

--------------------------------------------------------------------
--  Global diagnostic key‑maps
--------------------------------------------------------------------
local diag_opts = { noremap = true, silent = true }

vim.keymap.set("n", "e", vim.diagnostic.open_float, diag_opts)
vim.keymap.set("n", "dk", vim.diagnostic.goto_prev, diag_opts)
vim.keymap.set("n", "dj", vim.diagnostic.goto_next, diag_opts)
vim.keymap.set("n", "q", vim.diagnostic.setloclist, diag_opts)

--------------------------------------------------------------------
--  Server configurations – using vim.lsp.config()
--------------------------------------------------------------------
-- NOTE: All calls follow the pattern
--   vim.lsp.config("<server_name>", { <options> })
--   vim.lsp.enable("<server_name>")
--------------------------------------------------------------------


-- --------------------------------------------------------
--  Ansible
-- --------------------------------------------------------
vim.lsp.config("ansiblels", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach,
  filetypes = { "yaml", "yml", "ansible", "yaml.ansible" },
  settings  = {
    ansiblels = {
      exclude = {
        "azure-pipelines/**/*.y*l",
        "Azure-Pipelines/**/*.y*l",
        "Pipelines/*.y*l",
        "/*.azure*",
        "/azure-pipeline*.y*l"
      }
    }
  }
})
vim.lsp.enable("ansiblels")

-- --------------------------------------------------------
--  Generic YAML
-- --------------------------------------------------------
vim.lsp.config("yamlls", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach,
  settings  = {
    yaml = {
      format = { enable = false },
    },
  },
})
vim.lsp.enable("yamlls")

-- --------------------------------------------------------
--  Lua
-- --------------------------------------------------------
vim.lsp.config("lua_ls", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach,
  settings  = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
      },
    },
  },
})
vim.lsp.enable("lua_ls")

-- --------------------------------------------------------
--  Python
-- --------------------------------------------------------
vim.lsp.config("pylsp", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach
})
vim.lsp.enable("pylsp")

-- --------------------------------------------------------
--  TypeScript / JavaScript
-- --------------------------------------------------------
vim.lsp.config("ts_ls", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach
})
vim.lsp.enable("ts_ls")

-- --------------------------------------------------------
--  HTML
-- --------------------------------------------------------
vim.lsp.config("html", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach
})
vim.lsp.enable("html")

-- --------------------------------------------------------
--  Dockerfile
-- --------------------------------------------------------
vim.lsp.config("dockerls", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach
})
vim.lsp.enable("dockerls")

-- --------------------------------------------------------
--  JSON
-- --------------------------------------------------------
vim.lsp.config("jsonls", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach
})
vim.lsp.enable("jsonls")

-- --------------------------------------------------------
--  Bash
-- --------------------------------------------------------
vim.lsp.config("bashls", {
  root_dir  = vim.fn.getcwd(),
  on_attach = on_attach
})
vim.lsp.enable("bashls")

-- --------------------------------------------------------
--  Azure Pipelines
-- --------------------------------------------------------
vim.lsp.config("azure_pipelines_ls", {
  filetypes    = { "yaml", "yml" },
  root_markers = { ".git", "azure-pipeline*.y*l" },
  on_attach    = on_attach,
  settings     = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] =
        {
          "azure-pipelines/**/*.y*l",
          "Azure-Pipelines/**/*.y*l",
          "Pipelines/*.y*l",
          "/*.azure*",
          "/azure-pipeline*.y*l",
        },
      },
    },
  },
  root_dir     = vim.fn.getcwd(),
})
vim.lsp.enable("azure_pipelines_ls")
