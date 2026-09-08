return {
	"folke/snacks.nvim",
	event = "VimEnter",
	opts = {
		picker = {
			enabled = true,
			ui_select = true,
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		require("keybindings").setup_snacks_picker_keybindings(require("snacks").picker)
	end,
}
