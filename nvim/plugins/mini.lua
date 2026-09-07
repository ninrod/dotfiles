return {
	"echasnovski/mini.nvim",
	config = function()
		local mini_ai = require("mini.ai")
		local mini_extra = require("mini.extra")
		mini_ai.setup({
			n_lines = 500,
			search_method = "cover_or_nearest",
			mappings = {
				around = "a",
				inside = "i",
				around_next = "an",
				inside_next = "in",
				around_last = "al",
				inside_last = "il",
			},
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
