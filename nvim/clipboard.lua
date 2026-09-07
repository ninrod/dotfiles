vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "Win32Yank",
	copy = {
		["+"] = { "win32yank.exe", "-i", "--crlf" },
		["*"] = { "win32yank.exe", "-i", "--crlf" },
	},
	paste = {
		["+"] = { "win32yank.exe", "-o", "--lf" },
		["*"] = { "win32yank.exe", "-o", "--lf" },
	},
	cache_enabled = 1,
}

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
