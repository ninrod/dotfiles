-- multicursor.nvim clears 'clipboard' and snapshots the unnamed register as
-- soon as its first cursor is created. Seed that register from win32yank
-- first, so subsequent p/P operations use the same text for every cursor.
local M = {}

local function defaultClipboardRegister()
	local clipboard = vim.opt.clipboard:get()
	if vim.tbl_contains(clipboard, "unnamedplus") then return "+" end
	if vim.tbl_contains(clipboard, "unnamed") then return "*" end
end

local function seedUnnamedRegister()
	local register = defaultClipboardRegister()
	if not register then return end

	local contents = vim.fn.getreginfo(register)
	contents.points_to = nil
	vim.fn.setreg("", contents)
end

---@param mc table
function M.setup(mc)
	-- These are the public actions that can begin a multicursor session. The
	-- wrapper is intentionally a no-op after cursors exist: then the plugin's
	-- per-cursor unnamed registers must remain independent.
	local function wrapFirstCursorAction(name)
		local action = mc[name]
		if not action then return end

		mc[name] = function(...)
			if not mc.hasCursors() then seedUnnamedRegister() end
			return action(...)
		end
	end

	for _, name in ipairs({
		"addCursor",
		"addCursorOperator",
		"lineAddCursor",
		"matchAddCursor",
		"matchAllAddCursors",
		"searchAddCursor",
		"searchAllAddCursors",
		"handleMouse",
	}) do
		wrapFirstCursorAction(name)
	end
end

return M
