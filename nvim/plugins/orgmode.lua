return {
	"nvim-orgmode/orgmode",
	ft = { "org" },
	config = function()
		require("orgmode").setup({
			org_startup_folded = "overview",
			mappings = {
				disable_all = true,
			},
		})

		local group = vim.api.nvim_create_augroup("orgmode-keybindings", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = "org",
			callback = require("keybindings").setup_orgmode_keybindings,
		})

		if vim.bo.filetype == "org" then
			require("keybindings").setup_orgmode_keybindings({ buf = 0 })
		end
	end,
}
