--  See `:help vim.keymap.set()`
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set({ "n", "v" }, "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<CR>", "<cmd>w<CR>")
vim.keymap.set("n", "q", "ZQ")
vim.keymap.set("n", "Q", "q")

vim.keymap.set({ "n", "o", "x" }, "(", "{")
vim.keymap.set({ "n", "o", "x" }, ")", "}")

vim.keymap.set({ "n", "v" }, "gl", "G")

vim.keymap.set("n", "<space>j", "<C-F>")
vim.keymap.set("n", "<space>k", "<C-B>")
vim.keymap.set("n", "mk", "<cmd>bd<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

vim.keymap.set("n", "s", "<Nop>", { desc = "do nothing" })
vim.keymap.set("n", "sh", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "sl", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "sj", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "sk", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "sx", "<C-w>s", { desc = "create horizontal partition" })
vim.keymap.set("n", "sy", "<C-w>v", { desc = "create vertical partition" })

vim.keymap.set("v", "<Esc>", "<C-c>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- PLUGINS CONFIG SECTION
--
local M = {}

-- PLUGIN: BufExplorer keybindings
vim.keymap.set("n", "mi", "<cmd>BufExplorer<CR>")

-- PLUGIN: NEOTREE
vim.keymap.set("n", "\\", "<cmd>Neotree reveal<CR>", { desc = "NeoTree reveal" })
function M.neo_tree_window_mappings()
	return {
		["\\"] = "close_window",
	}
end

-- PLUGIN: Copilot Chat keybindings
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "[C]opilot [C]hat" })
vim.keymap.set("x", "<leader>ce", function()
	local copilot = require("CopilotChat")
	copilot.open()
	copilot.chat:add_message({
		role = "user",
		content = "#selection\n\nExplique o que este trecho de codigo faz.",
	})
	copilot.chat:follow()
	vim.cmd("startinsert")
end, { desc = "[C]opilot [E]dit explanation prompt" })

-- PLUGIN: Telescope keybindings
function M.setup_telescope_keybindings(builtin)
	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
	vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
	vim.keymap.set("n", "<BS>", builtin.find_files, { desc = "[S]earch [F]iles" })
	vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
	vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
	vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
	vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
	vim.keymap.set("n", "gh", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	vim.keymap.set("n", "<leader>/", function()
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "[/] Fuzzily search in current buffer" })
	vim.keymap.set("n", "<leader>s/", function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = "Live Grep in Open Files",
		})
	end, { desc = "[S]earch [/] in Open Files" })
	vim.keymap.set("n", "<leader>sn", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[S]earch [N]eovim files" })
end

-- PLUGIN: LSP keybindings
function M.setup_lsp_keybindings(event, client)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end
	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	map("gR", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "[T]oggle Inlay [H]ints")
	end
end

-- PLUGIN: Conform keybindings
function M.setup_conform_keybindings()
	vim.keymap.set("n", "<leader>f", function()
		require("conform").format({ async = true, lsp_fallback = true })
	end, { desc = "[F]ormat buffer" })
end

-- PLUGIN: Multicursor keybindings
function M.setup_multicursor_keybindings(mc)
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
	set({ "n", "x" }, "gm", mc.addCursorOperator)
	set("x", "I", mc.insertVisual)
	set("x", "A", mc.appendVisual)
	set({ "n", "x" }, "<leader>n", mc.searchAllAddCursors)
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
end

-- PLUGIN: nvim-cmp and LuaSnip keybindings
function M.cmp_mappings(cmp, luasnip)
	return cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	})
end

-- PLUGIN: nvim-dap keybindings
function M.setup_dap_keybindings(dap, dapui)
	vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
	vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
	vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
	vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
	vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
	vim.keymap.set("n", "<leader>B", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, { desc = "Debug: Set Breakpoint" })
	vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
end

-- PLUGIN: which-key group labels
function M.which_key_groups()
	return {
		{ "<leader>c", group = "[C]ode" },
		{ "<leader>c_", hidden = true },
		{ "<leader>d", group = "[D]ocument" },
		{ "<leader>d_", hidden = true },
		{ "<leader>r", group = "[R]ename" },
		{ "<leader>r_", hidden = true },
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>s_", hidden = true },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>t_", hidden = true },
		{ "<leader>w", group = "[W]orkspace" },
		{ "<leader>w_", hidden = true },
	}
end

return M
