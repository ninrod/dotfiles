return {
	"echasnovski/mini.nvim",
	config = function()
		local mini_extra = require("mini.extra")
		require("mini.ai").setup({
			n_lines = 500,
			custom_textobjects = {
				e = mini_extra.gen_ai_spec.buffer(),
			},
		})

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
