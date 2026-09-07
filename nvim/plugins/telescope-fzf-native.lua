return {
	"nvim-telescope/telescope-fzf-native.nvim",
	lazy = true,
	build = "make",
	cond = function()
		return vim.fn.executable("make") == 1
	end,
}
