return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	build = "make tiktoken",
	cmd = {
		"CopilotChat",
		"CopilotChatExplain",
		"CopilotChatToggle",
	},
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "[C]opilot [C]hat" },
		{
			"<leader>ce",
			function()
				local copilot = require("CopilotChat")
				copilot.open()
				copilot.chat:add_message({
					role = "user",
					content = "#selection\n\nExplique o que este trecho de codigo faz.",
				})
				copilot.chat:follow()
				vim.cmd("startinsert")
			end,
			mode = "x",
			desc = "[C]opilot [E]dit explanation prompt",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {},
}
