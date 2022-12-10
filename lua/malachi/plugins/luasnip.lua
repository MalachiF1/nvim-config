vim.cmd([[
  " Expand
  imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'
  " Jump forward
  imap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
  smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
  " Jump backward
  imap <silent><expr> <C-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
  smap <silent><expr> <C-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
  " Cycle forward through choice nodes
  imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
  smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]])

-- import luasnip plugin safely
local luasnip_status, ls = pcall(require, "luasnip")
if not luasnip_status then
	return
end

ls.config.set_config({
	-- Don't store snippet history for less overhead
	history = false,
	-- Allow autotrigger snippets
	enable_autosnippets = true,
	-- For equivalent of UltiSnips visual selection
	store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/malachi/plugins/lsp/snippets/" })

vim.keymap.set(
	"",
	"<Leader>U",
	'<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/malachi/plugins/lsp/snippets/"})<CR>'
)
