return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup(require("keybindings").which_key_groups())
	end,
}
