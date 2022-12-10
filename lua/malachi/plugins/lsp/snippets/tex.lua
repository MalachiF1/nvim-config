-- Manually triggered snippets
-- Manually triggered snippets
-- Manually triggered snippets
-- Manually triggered snippets
local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local get_visual = function(args, parent)
	if #parent.snippet.env.SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
	else
		return sn(nil, i(1, ""))
	end
end

-- Math context detection
local tex = {}
tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end

-- Return snippet tables
return
	-- Manually triggered snippets
	{},
		-- Autotriggered snippets
{
		s(
			{ trig = "env " },
			fmta(
				[[
                    \begin{<>}<>
                        <>
                    \end{<>}
                    <>
                ]],
				{

					i(1, ""),
					c(2, { t(""), sn(nil, { t("{"), i(1, ""), t("}") }) }),
					i(3, ""),
					rep(1),
					i(0),
				}
			)
		),
		s(
			{ trig = "equ " },
			fmta(
				[[
                    \begin{equation*}
                        <>
                    \end{equation*}
                    <>
                ]],
				{

					i(1, ""),
					i(2, ""),
				}
			)
		),
		s(
			{ trig = "enum " },
			fmta(
				[[
                    \begin{enumerate}
                        \item <>
                    \end{enumerate}
                    <>
                ]],
				{

					i(1, ""),
					i(2, ""),
				}
			)
		),
		s(
			{ trig = "eng " },
			fmta(
				[[
                    \begin{english}
                        <>
                    \end{english}
                    <>
                ]],
				{

					i(1, ""),
					i(2, ""),
				}
			)
		),
		s(
			{ trig = "hbw " },
			fmta(
				[[
                    \begin{hebrew}
                        <>
                    \end{hebrew}
                    <>
                ]],
				{

					i(1, ""),
					i(2, ""),
				}
			)
		),
		-- fraction
		s(
			{ trig = "([^%l])ff", regTrig = true, wordTrig = false },
			fmta("<>\\frac{<>}{<>}", {
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1, ""),
				i(2, ""),
			}),
			{ condition = tex.in_mathzone }
		),
		-- document template
		s(
			{ trig = "document*" },
			fmta(
				[[
                    % !TEX program = xelatex
                    \documentclass{article}
                    %\usepackage[utf8]{inputenc}
                    
                    \usepackage{polyglossia}
                    \usepackage{amsmath}
                    \usepackage{chemfig}
                    \setdefaultlanguage{hebrew}
                    \setotherlanguage{english}
                    \newfontfamily\hebrewfont[Script=Hebrew]{David CLM}
                    \newfontfamily\hebrewfontsf[Script=Hebrew]{Miriam CLM}
                    
                    \title{<>}
                    \author{מלאכי פרנקל}
                    
                    \begin{document}
                    \maketitle
                        <> 
                    \end{document}                ]],
				{

					i(1, ""),
					i(2, ""),
				}
			)
		),
		-- chimfig hexagon
		s(
			{ trig = "c6*" },
			fmta(
				[[
                    
                    (<>(-[:180]<>)*6(-<>(-<>)=<>(-<>)-<>(-<>)-<>(-<>)=<>(-<>)-))

                ]],
				{

					i(1, ""),
					i(2, ""),
					i(3, ""),
					i(4, ""),
					i(5, ""),
					i(6, ""),
					i(7, ""),
					i(8, ""),
					i(9, ""),
					i(10, ""),
					i(11, ""),
					i(12, ""),
				}
			)
		),
		-- chimfig quantegon
		s(
			{ trig = "c5*" },
			fmta(
				[[
                    
                    (<>(-[:180]<>)*5(-<>(-<>)=<>(-<>)-<>(-<>)-<>(-<>)=))

                ]],
				{

					i(1, ""),
					i(2, ""),
					i(3, ""),
					i(4, ""),
					i(5, ""),
					i(6, ""),
					i(7, ""),
					i(8, ""),
					i(9, ""),
					i(10, ""),
				}
			)
		),

		-- chimfig scheme
		s(
			{ trig = "scheme*" },
			fmta(
				[[
                    \chemnameinit{}                    
                    \schemestart
                        \chemname{\chemfig{<>}}{<>}
                        <>
                        \chemname{\chemfig{<>}}{<>}
                        \arrow{<>[<>][<>]}
                        \chemname{\chemfig{<>}}{<>}
                        <>
                        \chemname{\chemfig{<>}}{<>}
                    \schemestop
                    \chemnameinit{}
                ]],
				{

					i(1, ""),
					i(2, ""),
					i(3, "\\+"),
					i(4, ""),
					i(5, ""),
					i(6, "->"),
					i(7, ""),
					i(8, ""),
					i(9, ""),
					i(10, ""),
					i(11, "\\+"),
					i(11, ""),
					i(12, ""),
				}
			)
		),
	}
