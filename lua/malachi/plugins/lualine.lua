-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local ayu_dark = require("lualine.themes.ayu_dark")

-- new colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- change ayu-dark theme colors
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
