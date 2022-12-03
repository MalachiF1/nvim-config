-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local ayu_dark = require("lualine.themes.ayu_dark")

-- add command mode
ayu_dark.command = {
	a = {
		gui = "bold",
		bg = "#D2A6FF",
		fg = "#000000",
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = ayu_dark,
	},
})
