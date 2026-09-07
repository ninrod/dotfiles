vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "WslClipboardFast",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = {
			"sh",
			"-c",
			[[powershell.exe -NoProfile -command '$OutputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false); Get-Clipboard -Raw' | tr -d '\r' | perl -pe 'chomp if eof']],
		},
		["*"] = {
			"sh",
			"-c",
			[[powershell.exe -NoProfile -command '$OutputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false); Get-Clipboard -Raw' | tr -d '\r' | perl -pe 'chomp if eof]],
		},
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
