return {
	"chrisgrieser/nvim-spider",
	opts = {
		skipInsignificantPunctuation = false,
	},
	keys = {
		{ "w", "<cmd>lua require('patch/unicode-subword').motion('w')<CR>", mode = { "n", "o", "x" } },
		{ "e", "<cmd>lua require('patch/unicode-subword').motion('e')<CR>", mode = { "n", "o", "x" } },
		{ "b", "<cmd>lua require('patch/unicode-subword').motion('b')<CR>", mode = { "n", "o", "x" } },
		{ "ge", "<cmd>lua require('patch/unicode-subword').motion('ge')<CR>", mode = { "n", "o", "x" } },
	},
}
