-- ======================================================================
--                        User Key Mappings
-- ======================================================================

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
vim.keymap.set("n", "<leader>tv", ":NvimTreeFindFile<CR>", { noremap = true })

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

-- Generate Mermaid Diagram
vim.keymap.set("n", "<leader>gmm",
  ":w<CR>:!docker run -u $UID --rm -v " .. vim.fn.getcwd() .. ":/data minlag/mermaid-cli -i /data/%:t<CR>",
  { noremap = true })

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
vim.keymap.set("n", "<leader>sj", "]s", { noremap = true })
-- Find previous spelling mistake
vim.keymap.set("n", "<leader>sk", "[s", { noremap = true })
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
