-- ==========================================================================================
--                                LSP Servers Configuration
-- ==========================================================================================

--------------------------------------------------------------------
--  Global diagnostic key‑maps
--------------------------------------------------------------------
local diag_opts = { noremap = true, silent = true }

vim.keymap.set("n", "e", vim.diagnostic.open_float, diag_opts)
vim.keymap.set("n", "dk", vim.diagnostic.goto_prev, diag_opts)
vim.keymap.set("n", "dj", vim.diagnostic.goto_next, diag_opts)
vim.keymap.set("n", "q", vim.diagnostic.setloclist, diag_opts)

--------------------------------------------------------------------
--  Server configurations – using register()
--------------------------------------------------------------------
-- NOTE: All calls follow the pattern
--   register("<server_name>", { <options> })
--   vim.lsp.enable("<server_name>")
--------------------------------------------------------------------

--  Helper to register an LSP Server
local function register(name, cfg)
  vim.lsp.config(name, vim.tbl_extend("force", {
    on_attach    = {
      function(client, bufnr)
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
        vim.keymap.set("n", ";", function() vim.lsp.buf.format({ async = true }) end, bufopts)
      end
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    root_dir     = vim.fn.getcwd(),
  }, cfg or {}))

  vim.lsp.enable(name)
end


-- --------------------------------------------------------
--  Ansible
-- --------------------------------------------------------
register("ansiblels", {
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

-- --------------------------------------------------------
--  Generic YAML
-- --------------------------------------------------------
register("yamlls", {
  settings = {
    yaml = {
      format = { enable = false },
    },
  },
})

-- --------------------------------------------------------
--  Lua
-- --------------------------------------------------------
register("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
      },
    },
  },
})

-- --------------------------------------------------------
--  Python
-- --------------------------------------------------------
register("pylsp", {})

-- --------------------------------------------------------
--  TypeScript / JavaScript
-- --------------------------------------------------------
register("ts_ls", {})

-- --------------------------------------------------------
--  HTML
-- --------------------------------------------------------
register("html", {})

-- --------------------------------------------------------
--  Dockerfile
-- --------------------------------------------------------
register("dockerls", {})

-- --------------------------------------------------------
--  JSON
-- --------------------------------------------------------
register("jsonls", {})

-- --------------------------------------------------------
--  Bash
-- --------------------------------------------------------
register("bashls", {})

-- --------------------------------------------------------
--  Azure Pipelines
-- --------------------------------------------------------
register("azure_pipelines_ls", {
  filetypes    = { "yaml", "yml" },
  root_markers = { ".git", "azure-pipeline*.y*l" },
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
})
