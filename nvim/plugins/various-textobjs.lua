return {
	"chrisgrieser/nvim-various-textobjs",
	opts = {
		keymaps = {
			useDefaults = false,
		},
	},
	config = function(_, opts)
		require("various-textobjs").setup(opts)
	end,
	keys = {
		{
			"iw",
			'<cmd>lua require("various-textobjs").subword("inner")<CR>',
			mode = { "o", "x" },
		},
		{
			"aw",
			'<cmd>lua require("various-textobjs").subword("outer")<CR>',
			mode = { "o", "x" },
		},
	},
}
