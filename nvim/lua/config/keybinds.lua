-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("c", "<c-n>", function() if vim.fn.wildmenumode() == 1 then return "<c-n>" else return "<down>" end end, { expr = true })
vim.keymap.set("c", "<c-p>", function() if vim.fn.wildmenumode() == 1 then return "<c-p>" else return "<up>" end end, { expr = true })

-- search
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- better join
vim.keymap.set("n", "J", "mzJ`z")

-- preserve after paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Save
vim.keymap.set({"n", "v", "i"}, "<D-s>", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set({"n", "v", "i"}, "<C-s>", "<cmd>write<cr>", { desc = "Save" })

-- add empty lines
vim.keymap.set({ "n" }, "<s-cr>", ":put =nr2char(10)<cr>")

-- map kj to <esc>
vim.keymap.set("!", "kj", "<esc>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Repeat macro
vim.keymap.set('n', ',', '@@', { desc = 'Repeat macro' })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- space as esc in visual mode
vim.keymap.set("x", "<space>", "<esc>")

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- buffer
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Swap buffers" })
vim.keymap.set('n', '<leader>bq', '<cmd>bw<cr>', { desc = "Quit buffer" })

-- window
vim.keymap.set("n", "<leader>ww", "<c-w>p", { desc = "Swap window" })
vim.keymap.set("n", "<leader>wq", "<c-w>c", { desc = "Quit window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>w\\", "<C-W>v", { desc = "Split window right" })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split window right" })


-- terminal
-- vim.keymap.set("n", "<C-/>", "<cmd>split<cr><cmd>resize 15<cr><cmd>term<cr>i")
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Neorg
vim.keymap.set('n', '<leader>n', '<cmd>Neorg<cr>', { desc = 'Neorg' })
