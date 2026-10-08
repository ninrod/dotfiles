return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = false,
		keymaps = require("keybindings").oil_buffer_mappings(),
	},
}
