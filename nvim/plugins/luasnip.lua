return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	build = (function()
		if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
			return
		end
		return "make install_jsregexp"
	end)(),
}
