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
			function()
				require("unicode-subword").subword("inner")
			end,
			mode = { "o", "x" },
		},
		{
			"aw",
			function()
				require("unicode-subword").subword("outer")
			end,
			mode = { "o", "x" },
		},
	},
}
