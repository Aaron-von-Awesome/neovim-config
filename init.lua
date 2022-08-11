-- ==========================================================================================
--                           Neovim Config File von Awesome
-- ==========================================================================================

-- -----------------------------------------------------------
--                      Requires
-- -----------------------------------------------------------

require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "yaml", "lua", "bash", "vim", "typescript", "toml",
    "sql", "ruby", "regex", "python", "php", "markdown",
    "make", "json", "javascript", "java", "http", "html",
    "graphql", "go", "dot", "css", "comment", "c_sharp", "c"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

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
  ensure_installed = { "ansiblels@0.5.0", "yamlls", "sumneko_lua", "dotls", "pyright", "gopls", "tsserver", "html",
    "dockerls" },
  automatic_installation = true
})


-- -----------------------------------------------------------
--                LSP Mappings and Settings
-- -----------------------------------------------------------

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
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
  vim.keymap.set("n", "<leader>fm", ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
end

require("lspconfig").ansiblels.setup({
  on_attach = on_attach,
})

require("lspconfig").yamlls.setup({
  on_attach = on_attach,
})

require("lspconfig").sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` and `use` global
        globals = { 'vim', 'use' },
      },
    },
  },
})

require("lspconfig").dotls.setup({
  on_attach = on_attach,
})

require("lspconfig").pyright.setup({
  on_attach = on_attach,
})

require("lspconfig").gopls.setup({
  on_attach = on_attach,
})

require("lspconfig").tsserver.setup({
  on_attach = on_attach,
})

require("lspconfig").html.setup({
  on_attach = on_attach,
})

require("lspconfig").dockerls.setup({
  on_attach = on_attach,
})


-- -----------------------------------------------------------
--                  Magical Auto Commands
-- -----------------------------------------------------------

local augroup = vim.api.nvim_create_augroup
VonAwesomeGroup = augroup('VonAwesome', {})

local autocmd = vim.api.nvim_create_autocmd

-- Trim white space
autocmd({ "BufWritePre" }, {
  group = VonAwesomeGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})


-- -----------------------------------------------------------
--                      General Settings
-- -----------------------------------------------------------

-- Set Leader Key
vim.g.mapleader = " "
vim.keymap.set("n", "<space>", "<nop>", { noremap = true })

-- Syntax Highlighting
vim.opt.syntax = "on"

-- Search Path
vim.opt.path = vim.opt.path + "**"

-- Ignore tags file in searches like vimgrep
vim.opt.wildignore = vim.opt.wildignore + "tags"

-- Colors/Color Schemes
vim.opt.termguicolors = true
vim.g.codedark_conservative = 1
vim.cmd [[colorscheme codedark]]

-- Set indent character for indent-blankline.nvim plugin
vim.g.indent_blankline_char = "⦙"

-- File Browsing Window properties
vim.g.netrw_preview = 1
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_browse_split = 4

-- Buffer Settings
vim.opt.hidden = true

-- Sign Column Settings
vim.opt.signcolumn = "yes"

-- Line Number Settings
vim.opt.relativenumber = true

-- Show line under cursor
vim.opt.cursorline = true

-- Tab Options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search Options
--vim.opt.nohlsearch = true
vim.opt.ignorecase = true

--If your search has an upper case character in it,
--then search will be case sensitive, else case insensitive
vim.opt.smartcase = true

--Show substitutions incrementally
vim.opt.inccommand = "nosplit"

-- File History Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Scrolling Options
--Start scrolling the screen up or down when the cursor is 10 rows from the top or bottom
vim.opt.scrolloff = 10

-- Window Options
--Put horizontally split new windows below
vim.opt.splitbelow = true

-- Folding
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


-- ----------------------------------------------------------
--                  Custom Key Bindings
-- ----------------------------------------------------------
-- vim.keymap.set("<mode>", "<keys>", "<actions>", {<options>})

-- Quick reload of init.lua
vim.keymap.set("n", "<leader><CR>",
  ":execute 'lua vim.lsp.stop_client(vim.lsp.get_active_clients())' | luafile ~/.config/nvim/init.lua<CR>",
  { noremap = true })

-- Navigate between windows easier
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.keymap.set("n", "<leader><tab>", "<c-^>", { noremap = true })

-- Move lines of blocks of lines at once
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Shortcut for :noh
vim.keymap.set("n", "<leader>nh", ":noh<CR>", { noremap = true })

-- Open tree view for current file directory
vim.keymap.set("n", "<leader>tv", ":wincmd v<bar> Ex <bar> vertical resize 45<CR>", { noremap = true })
vim.keymap.set("n", "<leader>th", ":wincmd s<bar> Ex <bar> resize 20<CR>", { noremap = true })

-- Return to Normal mode whilst in Insert mode using the Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Still need to be able to send <Esc> whilst using Terminal
vim.keymap.set("t", "<A-[>", "<Esc>", { noremap = true })

-- I keep typing Q
vim.keymap.set("n", "Q", "<nop>", { noremap = true })

-- Generate Graphviz custom key binding (TODO: How do I detect a dot file, and
-- only allow this to run against a dot file?)
vim.keymap.set("n", "<leader>ggv", ":w<CR>:!dot -T png % -o %:r.png<CR>", { noremap = true })
vim.keymap.set("n", "<leader>vgv", ":!display %:r.png &<CR>", { noremap = true })

-- Copy & Paste to/from system clipboard
vim.keymap.set("n", "<leader>y", "\"+yy", { noremap = true })
vim.keymap.set("v", "<leader>y", "\"+y", { noremap = true })
vim.keymap.set("n", "<leader>Y", "gg\"+yG", { noremap = true })
vim.keymap.set("n", "<leader>p", "\"+p", { noremap = true })
vim.keymap.set("v", "<leader>p", "\"+p", { noremap = true })

-- Copy relative path
vim.keymap.set("n", "<leader>cf", ":let @+=expand(\"%\")<CR>", { noremap = true })

-- Copy absolute path
vim.keymap.set("n", "<leader>cF", ":let @+=expand(\"%:p\")<CR>", { noremap = true })

-- Window Controls
vim.keymap.set("n", "<A-Up>", ":lua vim.cmd[[vert resize +5]]<CR>", { noremap = true })
vim.keymap.set("n", "<A-Down>", ":lua vim.cmd[[vert resize -5]]<CR>", { noremap = true })
vim.keymap.set("n", "<C-Up>", ":lua vim.cmd[[resize +5]]<CR>", { noremap = true })
vim.keymap.set("n", "<C-Down>", ":lua vim.cmd[[resize -5]]<CR>", { noremap = true })

-- Spell Check
vim.keymap.set("n", "<leader>ss", ":lua vim.opt.spell = true<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sns", ":lua vim.opt.spell = false<CR>", { noremap = true })

-- Find next spelling mistake
vim.keymap.set("n", "<leader>sl", "]s", { noremap = true })
-- Find previous spelling mistake
vim.keymap.set("n", "<leader>sh", "[s", { noremap = true })
-- z= - Replace misspelled word
-- zg - Good word: Add the word under the cursor to the dictionary
-- zw - Woops! Undo and remove the word from the dictionary

-- Word Wrap
vim.opt.wrap = false
vim.keymap.set("n", "<leader>snw", ":lua vim.opt.wrap = false<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sw", ":lua vim.opt.wrap = true<CR>", { noremap = true })

-- Quickfix List Navigation
vim.keymap.set("n", "<C-j>", ":cnext<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":cprev<CR>", { noremap = true })

-- Generate ctags
vim.keymap.set("n", "<leader>gct", ":!ctags -R *<CR>", { noremap = true })

-- -----------------------------------------------------------
--                        Status Bar
-- -----------------------------------------------------------

-- Left Side
vim.opt.statusline = ""
vim.opt.statusline = vim.opt.statusline + " %M"
vim.opt.statusline = vim.opt.statusline + " %y"
vim.opt.statusline = vim.opt.statusline + " %r"
vim.opt.statusline = vim.opt.statusline + " %F"

-- Right side
vim.opt.statusline = vim.opt.statusline + "%="
vim.opt.statusline = vim.opt.statusline + " %c:%l/%L"
vim.opt.statusline = vim.opt.statusline + " %p%%"
vim.opt.statusline = vim.opt.statusline + " [%n]"

-- -----------------------------------------------------------
--                       Markdown Composer Options
-- -----------------------------------------------------------
vim.g.markdown_composer_autostart = 0


-- -----------------------------------------------------------
--                       Telescope
-- -----------------------------------------------------------
-- Find files using Telescope

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
