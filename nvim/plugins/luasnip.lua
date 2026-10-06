return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	build = (function()
		if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
			return
		end
		return "make install_jsregexp"
	end)(),
	config = function()
		local luasnip = require("luasnip")
		luasnip.config.setup({})
		-- Preserve intentional blank lines in the migrated YASnippet bodies.
		local parse_snipmate = luasnip.parser.parse_snipmate
		luasnip.parser.parse_snipmate = function(context, body, opts)
			return parse_snipmate(context, body, vim.tbl_extend("keep", opts or {}, { trim_empty = false }))
		end
		require("luasnip.loaders.from_snipmate").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/snippets" },
		})
	end,
}
