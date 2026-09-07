local plugins = {}
local plugin_path = vim.fn.stdpath("config") .. "/plugins"
local filenames = vim.fn.readdir(plugin_path)

table.sort(filenames)

for _, filename in ipairs(filenames) do
	if filename ~= "init.lua" and filename:sub(-4) == ".lua" then
		local module = filename:sub(1, -5)
		table.insert(plugins, require("plugins." .. module))
	end
end

return plugins
