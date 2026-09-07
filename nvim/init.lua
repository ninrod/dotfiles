-- setup inicial
local config_path = vim.fn.stdpath("config")
package.path = config_path .. "/?.lua;" .. config_path .. "/?/init.lua;" .. package.path

-- carregamento dos módulos adicionais
require("options")
require("filetypes")
require("lazy-setup")
require("clipboard")
require("keybindings")
