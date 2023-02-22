require("user.colorschemes.nightfox")
require("user.colorschemes.catppuccin")
require("user.colorschemes.gruvbox")
require("user.colorschemes.tokyonight")

local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
