return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			transparent_background = true,
		})
		vim.o.background = "dark"
		vim.cmd.colorscheme("gruvbox")
		vim.cmd.hi("Comment gui=none")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
