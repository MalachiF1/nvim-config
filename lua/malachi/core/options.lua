local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wraping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")
vim.api.nvim_set_option("clipboard", "unnamed")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- "-" counts as part of word
opt.iskeyword:append("-")

-- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
opt.formatoptions:remove({ "c", "r", "o" })

-- allow the mouse to be used in neovim
opt.mouse = "a"

-- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
opt.clipboard = "unnamedplus"

-- highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

-- git rid off ~ character on blank buffers
opt.fillchars = { eob = " " }

-- make vim commands work when in hebrew
opt.keymap = "hebrew"
opt.iminsert = 0
opt.imsearch = -1

-- opt.langmap = {
-- 	"AA",
-- 	"BB",
-- 	"CC",
-- 	"DD",
-- 	"EE",
-- 	"FF",
-- 	"GG",
-- 	"HH",
-- 	"II",
-- 	"JJ",
-- 	"KK",
-- 	"LL",
-- 	"MM",
-- 	"NN",
-- 	"OO",
-- 	"PP",
-- 	"QQ",
-- 	"RR",
-- 	"SS",
-- 	"TT",
-- 	"UU",
-- 	"VV",
-- 	"WW",
-- 	"XX",
-- 	"YY",
-- 	"ZZ",
-- 	"שa",
-- 	"נb",
-- 	"בc",
-- 	"גd",
-- 	"קe",
-- 	"כf",
-- 	"עg",
-- 	"יh",
-- 	"ןi",
-- 	"חj",
-- 	"לk",
-- 	"ךl",
-- 	"צm",
-- 	"מn",
-- 	"םo",
-- 	"פp",
-- 	"/q",
-- 	"רr",
-- 	"דs",
-- 	"אt",
-- 	"וu",
-- 	"הv",
-- 	"'w",
-- 	"סx",
-- 	"טy",
-- 	"זz",
-- }
