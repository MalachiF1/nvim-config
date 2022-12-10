-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		disable = { "latex" },
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"gitignore",
		"cpp",
		"rust",
		"rust",
		"latex",
		"scss",
		"regex",
		"sql",
	},
	-- auto install above language parsers
	auto_install = true,

	rainbow = { -- bracket pair highlighter (nvim-ts-rainbow plugin)
		enable = true,
		extended_mode = true,
		colors = {
			"#CCCAC2",
			"#F29E74",
			"#DFBFFF",
			"#FFDFB3",
			"#FF6666",
			"#4CBF99",
		},
	},
})
