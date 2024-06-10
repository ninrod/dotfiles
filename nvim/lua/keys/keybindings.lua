--  See `:help vim.keymap.set()`
--
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set({ "n", "v" }, "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<CR>", "<cmd>w<CR>")
vim.keymap.set("n", "q", "ZQ")
vim.keymap.set("n", "Q", "q")

vim.keymap.set({ "n", "o", "x" }, "(", "{")
vim.keymap.set({ "n", "o", "x" }, ")", "}")

vim.keymap.set({ "n", "v" }, "gl", "G")

vim.keymap.set("n", "<space>j", "<C-F>")
vim.keymap.set("n", "<space>k", "<C-B>")
vim.keymap.set("n", "mk", "<cmd>bd<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>x", "<C-w>s", { desc = "create horizontal partition" })
vim.keymap.set("n", "<leader>y", "<C-w>v", { desc = "create vertical partition" })

vim.keymap.set("v", "<Esc>", "<C-c>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
