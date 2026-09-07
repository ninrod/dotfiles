return {
	"gbprod/substitute.nvim",
	opts = {},
	config = function(_, opts)
		local substitute = require("substitute")
		local exchange = require("substitute.exchange")

		substitute.setup(opts)

		for _, lhs in ipairs({ "gra", "gri", "grn", "grt", "grx" }) do
			if vim.fn.maparg(lhs, "n") ~= "" then
				vim.keymap.del("n", lhs)
			end
		end

		vim.keymap.set("n", "gr", substitute.operator, { desc = "Replace with register" })
		vim.keymap.set("n", "grr", substitute.line, { desc = "Replace line with register" })
		vim.keymap.set("x", "gr", substitute.visual, { desc = "Replace selection with register" })

		vim.keymap.set("n", "cx", exchange.operator, { desc = "Exchange text" })
		vim.keymap.set("n", "cxx", exchange.line, { desc = "Exchange line" })
		vim.keymap.set("x", "X", exchange.visual, { desc = "Exchange selection" })
		vim.keymap.set("n", "cxc", exchange.cancel, { desc = "Cancel exchange" })
	end,
}
