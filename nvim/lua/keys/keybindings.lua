--  See `:help vim.keymap.set()`
--
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set({ "n", "v" }, "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<CR>", "<cmd>w<CR>")
vim.keymap.set("n", "q", "ZQ")
vim.keymap.set("n", "Q", "q")

vim.keymap.set({ "o", "x" }, "(", "{")
vim.keymap.set({ "o", "x" }, ")", "}")

vim.keymap.set({ "n", "v" }, "gl", "G")
