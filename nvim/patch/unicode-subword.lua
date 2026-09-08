-- Unicode-aware "subword" text object for `iw`/`aw`.
--
-- `nvim-various-textobjs`' built-in `subword()` splits camelCase/snake_case/
-- kebab-case words using plain Lua patterns (`%a`, `%l`, `%u`), which only
-- recognize ASCII letters. Any accented letter (á, ã, ç, é, í, ó, ú, ...) is
-- therefore treated as a word *boundary*, so e.g. `ciw` on "avi[ã]ozão" would
-- only delete "ãozão" instead of the whole word.
--
-- This module reimplements the same camelCase/snake_case/kebab-case-aware
-- segmentation, but classifies each character with `vim.fn.tolower`/
-- `vim.fn.toupper` (which are Unicode-aware) instead of ASCII-only Lua
-- patterns. This way, accents are never treated as case/word boundaries:
-- what matters is casing/underscore/hyphen style, not whether a letter is
-- accented.
local M = {}

---@param char string a single character
---@return "U"|"L"|"D"|"S"|"O" class upper letter, lower letter, digit, separator (`_`/`-`), other
local function classify(char)
	if char == "_" or char == "-" then return "S" end
	if char:match("%d") then return "D" end

	local lower, upper = vim.fn.tolower(char), vim.fn.toupper(char)
	if lower ~= upper then
		if char == lower then return "L" end
		if char == upper then return "U" end
	end

	-- letters without case distinction (e.g. some scripts) still count as
	-- part of a word, just like a lowercase letter
	if char:match("%w") then return "L" end

	return "O"
end

---@return string[] chars, integer[] byteStarts, string line
local function getLineChars()
	local line = vim.api.nvim_get_current_line()
	local nchars = vim.fn.strchars(line)
	local chars, byteStarts = {}, {}
	for i = 0, nchars - 1 do
		chars[#chars + 1] = vim.fn.strcharpart(line, i, 1)
		byteStarts[#byteStarts + 1] = vim.fn.byteidx(line, i)
	end
	byteStarts[#byteStarts + 1] = #line -- sentinel: end of line
	return chars, byteStarts, line
end

---selects char indices [selStart, selEnd] (1-based, inclusive) of the current line
---@param row integer
---@param byteStarts integer[]
---@param selStart integer
---@param selEnd integer
local function selectCharRange(row, byteStarts, selStart, selEnd)
	local startPos = { row, byteStarts[selStart] }
	local endPos = { row, byteStarts[selEnd + 1] - 1 }
	vim.api.nvim_win_set_cursor(0, startPos)
	vim.cmd(vim.fn.mode() == "v" and "normal! o" or "normal! v")
	vim.api.nvim_win_set_cursor(0, endPos)
end

---@param scope "inner"|"outer"
function M.subword(scope)
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local chars, byteStarts = getLineChars()
	local nchars = #chars
	if nchars == 0 then return end

	local classes = {}
	for i, c in ipairs(chars) do
		classes[i] = classify(c)
	end

	local cursorIdx = vim.fn.charidx(vim.api.nvim_get_current_line(), col) + 1
	if cursorIdx < 1 or cursorIdx > nchars then return end

	if classes[cursorIdx] == "O" then
		-- not on a word character (whitespace/punctuation): select the
		-- contiguous run of the same kind of non-word character, same as
		-- vim's native `iw`/`aw` would for such a run
		local isBlank = chars[cursorIdx]:match("%s") ~= nil
		local function sameGroup(idx)
			if classes[idx] ~= "O" then return false end
			return (chars[idx]:match("%s") ~= nil) == isBlank
		end
		local s, e = cursorIdx, cursorIdx
		while s > 1 and sameGroup(s - 1) do
			s = s - 1
		end
		while e < nchars and sameGroup(e + 1) do
			e = e + 1
		end
		selectCharRange(row, byteStarts, s, e)
		return
	end

	-- find the maximal contiguous "word" span (letters/digits/_/-) around the cursor
	local wordStart, wordEnd = cursorIdx, cursorIdx
	while wordStart > 1 and classes[wordStart - 1] ~= "O" do
		wordStart = wordStart - 1
	end
	while wordEnd < nchars and classes[wordEnd + 1] ~= "O" do
		wordEnd = wordEnd + 1
	end

	-- segment the word into camelCase/UPPER_CASE/number/single-char subwords,
	-- attaching a single trailing separator (if any) to each segment
	local segStart, segEnd, segSepIdx
	local i = wordStart
	while i <= wordEnd do
		local c = classes[i]
		local startIdx = i
		local endIdx = i

		if c == "D" then
			while endIdx < wordEnd and classes[endIdx + 1] == "D" do
				endIdx = endIdx + 1
			end
		elseif c == "U" then
			local upperEnd = i
			while upperEnd < wordEnd and (classes[upperEnd + 1] == "U" or classes[upperEnd + 1] == "D") do
				upperEnd = upperEnd + 1
			end
			if upperEnd > i then
				endIdx = upperEnd -- UPPER_CASE run
			else
				local camelEnd = i
				while camelEnd < wordEnd and (classes[camelEnd + 1] == "L" or classes[camelEnd + 1] == "D") do
					camelEnd = camelEnd + 1
				end
				endIdx = camelEnd -- PascalCase-like segment, or single upper char
			end
		else -- "L" or "S" (stray separator not attached as trailing)
			while endIdx < wordEnd and (classes[endIdx + 1] == "L" or classes[endIdx + 1] == "D") do
				endIdx = endIdx + 1
			end
		end

		local sepIdx = nil
		if endIdx < wordEnd and classes[endIdx + 1] == "S" then sepIdx = endIdx + 1 end

		if cursorIdx >= startIdx and cursorIdx <= endIdx then
			segStart, segEnd, segSepIdx = startIdx, endIdx, sepIdx
			break
		end

		i = sepIdx and (sepIdx + 1) or (endIdx + 1)
	end

	if not segStart then return end

	local selStart, selEnd = segStart, segEnd
	if scope == "outer" then
		if segSepIdx then
			selEnd = segSepIdx
		elseif segStart > wordStart and classes[segStart - 1] == "S" then
			-- last part of a snake_case/kebab-case word: grab the leading
			-- separator too, since there is no trailing one to grab
			selStart = segStart - 1
		end
	end

	selectCharRange(row, byteStarts, selStart, selEnd)
end

return M
