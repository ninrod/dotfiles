return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set
		set({ "n", "x" }, "<up>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "x" }, "<down>", function()
			mc.lineAddCursor(1)
		end)
		set({ "n", "x" }, "<leader><up>", function()
			mc.lineSkipCursor(-1)
		end)
		set({ "n", "x" }, "<leader><down>", function()
			mc.lineSkipCursor(1)
		end)
		set({ "n", "x" }, "<leader>n", function()
			mc.matchAddCursor(1)
		end)
		set({ "n", "x" }, "<leader>s", function()
			mc.matchSkipCursor(1)
		end)
		set({ "n", "x" }, "<leader>N", function()
			mc.matchAddCursor(-1)
		end)
		set({ "n", "x" }, "<leader>S", function()
			mc.matchSkipCursor(-1)
		end)
		set("n", "<c-leftmouse>", mc.handleMouse)
		set("n", "<c-leftdrag>", mc.handleMouseDrag)
		set("n", "<c-leftrelease>", mc.handleMouseRelease)
		set({ "n", "x" }, "<c-q>", mc.toggleCursor)
		set({ "n", "x" }, "ga", mc.addCursorOperator)
		set("x", "I", mc.insertVisual)
		set("x", "A", mc.appendVisual)
		set("n", "<leader>n", mc.searchAllAddCursors)

		mc.addKeymapLayer(function(layer_set)
			layer_set({ "n", "x" }, "<left>", mc.prevCursor)
			layer_set({ "n", "x" }, "<right>", mc.nextCursor)
			layer_set({ "n", "x" }, "<leader>x", mc.deleteCursor)
			layer_set("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)

		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { reverse = true })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { reverse = true })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
