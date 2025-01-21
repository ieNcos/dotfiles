local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- This is the `get_visual` function I've been talking about.
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {

s({ trig = "beg", snippetType = "snippet" },
	fmta([[
		\begin{<>}
			<>
		\end{<>}]],
	  { i(1), i(0), rep(1) }
  )
),

s({trig = "mathArticle",
dscr = "article",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
%! TEX program = xelatex
\documentclass{article}    
\usepackage{amsmath}
\usepackage{ctex}
\usepackage[margin=0.3in]{geometry}
\usepackage{multirow}
\usepackage{graphicx}
\usepackage{float}
\usepackage{tikz}
\usepackage{circuitikz}

\title{<>}
\author{<>}
\date{<>}

\begin{document}
\maketitle

<>

\end{document}
]], {
    i(1),
    i(2),
    i(3),
    i(0),
}), {}),

s({trig = "trig",
dscr = "description",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
main
]], {
    nodes
}), {condition}),

s({trig = "figure",
dscr = "figure-env",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
\begin{figure}[H]
\center
<>
\end{figure}
]], {
    i(0)
}), {}),

s({trig = "graph",
dscr = "graphicx",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
\includegraphics[height=<>cm]{"<>"}
\caption{<>}
\label{fig:<>} 
]], {
    i(1),
    i(2),
    i(3),
    i(0)
}), {}),

s({trig = "sec",
dscr = "section",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
\<>section{<>}
]], {
    i(1),
    i(0)
}), {}),


}
