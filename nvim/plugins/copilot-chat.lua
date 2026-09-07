return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	build = "make tiktoken",
	cmd = {
		"CopilotChat",
		"CopilotChatExplain",
		"CopilotChatToggle",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {},
}
