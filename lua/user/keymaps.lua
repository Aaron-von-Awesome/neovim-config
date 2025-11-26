-- ==========================================================================================
--                        User Key Mappings
-- ==========================================================================================

-- vim.keymap.set("<mode>", "<keys>", "<actions>", {<options>})

local opts = { noremap = true }

-- Quick reload of init.lua
vim.keymap.set(
  "n",
  "<Leader><CR>",
  function()
    for _, client in ipairs(vim.lsp.get_clients()) do
      client:stop()
    end
    vim.cmd("luafile " .. vim.fn.expand("~/.config/nvim/init.lua"))
  end,
  { noremap = true, silent = true }
)

-- Navigate between windows easier
vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<Leader>j", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<Leader>k", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<Leader>l", ":wincmd l<CR>", opts)
vim.keymap.set("n", "<Leader><tab>", "<c-^>", opts)

-- Move lines of blocks of lines at once
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Shortcut for :noh
vim.keymap.set("n", "<Leader>nh", ":noh<CR>", opts)

-- Open tree view for current file directory
vim.keymap.set("n", "<Leader>tv", ":NvimTreeFindFile<CR>", opts)

-- Return to Normal mode whilst in Insert mode using the Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)

-- Still need to be able to send <Esc> whilst using Terminal
vim.keymap.set("t", "<A-[>", "<Esc>", opts)

-- I keep typing Q
vim.keymap.set("n", "Q", "<nop>", opts)

-- Generate Graphviz custom key binding (TODO: How do I detect a dot file, and
-- only allow this to run against a dot file?)
vim.keymap.set("n", "<Leader>ggv", ":w<CR>:!dot -T png % -o %:r.png<CR>", opts)
vim.keymap.set("n", "<Leader>vgv", ":!display %:r.png &<CR>", opts)

-- Generate Mermaid Diagram
vim.keymap.set("n", "<Leader>gmm",
  ":w<CR>:!docker run --rm -u `id -u`:`id -g` -v " ..
  vim.fn.getcwd() .. ":/data ghcr.io/mermaid-js/mermaid-cli/mermaid-cli --scale 10 --outputFormat png -i /data/%:t<CR>",
  { noremap = true })

-- Copy & Paste to/from system clipboard
vim.keymap.set("n", "<Leader>y", "\"+yy", opts)
vim.keymap.set("v", "<Leader>y", "\"+y", opts)
vim.keymap.set("n", "<Leader>Y", "gg\"+yG", opts)
vim.keymap.set("n", "<Leader>p", "\"+p", opts)
vim.keymap.set("v", "<Leader>p", "\"+p", opts)

-- Copy relative path
vim.keymap.set("n", "<Leader>cf", ":let @+=expand(\"%\")<CR>", opts)

-- Copy absolute path
vim.keymap.set("n", "<Leader>cF", ":let @+=expand(\"%:p\")<CR>", opts)

-- Window Controls
vim.keymap.set("n", "<A-Up>", ":lua vim.cmd[[vert resize +5]]<CR>", opts)
vim.keymap.set("n", "<A-Down>", ":lua vim.cmd[[vert resize -5]]<CR>", opts)
vim.keymap.set("n", "<C-Up>", ":lua vim.cmd[[resize +5]]<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":lua vim.cmd[[resize -5]]<CR>", opts)

-- Spell Check
vim.keymap.set("n", "<Leader>ss", ":lua vim.opt.spell = true<CR>", opts)
vim.keymap.set("n", "<Leader>sns", ":lua vim.opt.spell = false<CR>", opts)

-- Find next spelling mistake
vim.keymap.set("n", "<Leader>sj", "]s", opts)
-- Find previous spelling mistake
vim.keymap.set("n", "<Leader>sk", "[s", opts)
-- z= - Replace misspelled word
-- zg - Good word: Add the word under the cursor to the dictionary
-- zw - Woops! Undo and remove the word from the dictionary

-- Word Wrap
vim.opt.wrap = false
vim.keymap.set("n", "<Leader>snw", ":lua vim.opt.wrap = false<CR>", opts)
vim.keymap.set("n", "<Leader>sw", ":lua vim.opt.wrap = true<CR>", opts)

-- Quickfix List Navigation
vim.keymap.set("n", "<C-j>", ":cnext<CR>", opts)
vim.keymap.set("n", "<C-k>", ":cprev<CR>", opts)

-- Generate ctags
vim.keymap.set("n", "<Leader>gct", ":!ctags -R *<CR>", opts)

-- Open up a split Terminal
vim.keymap.set("n", "<Leader>st", ":sp|term<CR>", opts)
