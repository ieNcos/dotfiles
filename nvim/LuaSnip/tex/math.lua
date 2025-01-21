-- generating function
local mat = function(args, snip)
    local rows = tonumber(snip.captures[2])
    local cols = tonumber(snip.captures[3])
    local nodes = {}
    local ins_indx = 1 
    for j = 1, rows do 
        table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
        ins_indx = ins_indx + 1 
        for k = 2, cols do 
            table.insert(nodes, t(" & "))
            table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1))) 
            ins_indx = ins_indx + 1 
        end 
        table.insert(nodes, t({ " \\\\", "" }))
    end
    -- fix last node.
    nodes[#nodes] = t(" \\\\")
    return sn(nil, nodes)
end


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

s({trig = "mm", wordTrig = true, trigEngine = "pattern", snippetType = "autosnippet"},
  fmta(
    "$<>$",
    {
      d(1, get_visual),
    }
  )
),
s({trig = "eq", dscr = "Expands 'eq' into an equation environment"},
  fmta(
     [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
     { i(0) }
  )
),

s({trig = "sq", dscr = "description", snippetType = "autosnippet", wordTrig = false, trigEngine = "plain"}, fmta([[
\sqrt{<>}
]], {
    i(1)
}), {
    condition = in_mathzone
}),

s({trig = "ff", snippetType = "autosnippet", dscr = "Expands 'ff' into '\\frac{}{}'"}, fmta([[
\frac{<>}{<>}
]], {
    i(1),
    i(2),
}), {
    condition = in_mathzone
}),

s({trig = [[(\d+|\d*\\?[A-Za-z]+(?:\\[A-Za-z]+)*(?:(?:\^|_)(?:\{\w+\}|\w))*)//]] ,
snippetType = "autosnippet",
trigEngine = "ecma"}, fmta([[
    \frac{<>}{<>}
]], {
    f(function(_, snip) return snip.captures[1] end),
    i(1)
}), {
    condition = in_mathzone
}),

s({trig = "sum", snippetType = "autosnippet", dscr = "Expands 'su' into '\\sum'"},
	fmta(
		"\\sum_{<>}^{<>}",
		{ i(1), i(2) }
	),
	{ condition = in_mathzone }
),

s({trig = "int", snippetType = "autosnippet", dscr = "Expands 'ii' into '\\int'"},
	fmta(
		"\\int_{<>}^{<>}",
		{ i(1), i(2) }
	),
	{ condition = in_mathzone }
),

s({trig = "iin", dscr = "iint", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\iint_{<>}^{<>}",
        { i(1), i(2) }
    ),
    { condition = in_mathzone }
),

s({trig = "iii", dscr = "iint", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\iiint_{<>}^{<>}",
        { i(1), i(2) }
    ),
    { condition = in_mathzone }
),

s({trig = "oi", dscr = "oint", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\oint_{<>}^{<>}",
        { i(1), i(0) }
    ),
    { condition = in_mathzone }
),

s({trig = "dott", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta([[
    \dot{<>}]],
		{ i(1) }
  ),
  { condition = in_mathzone }
),
s({trig = "ddott", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta(
    "\\ddot{<>}",
		{ i(1) }
  ),
  { conditon = in_mathzone }
),
s({trig = "cdots", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta(
    "\\cdots",
		{  }
  ),
  { condition = in_mathzone }
),
s({trig = "vdots", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta(
    "\\vdots",
		{  }
  ),
  { condition = in_mathzone }
),
s({ trig = "([bBpvV])mat(%d+)x(%d+)([ar])", regTrig = true, name = "matrix", dscr = "matrix trigger lets go", hidden = true },
  fmt([[
    \begin{<>}<>
    <>
    \end{<>}]], 
    {f(function(_, snip)
        return snip.captures[1] .. "matrix" -- captures matrix type
    end),
    f(function(_, snip)
        if snip.captures[4] == "a" then
            out = string.rep("c", tonumber(snip.captures[3]) - 1) -- array for augment 
            return "[" .. out .. "|c]"
        end
        return "" -- otherwise return nothing
    end),
    d(1, mat),
    f(function(_, snip)
        return snip.captures[1] .. "matrix" -- i think i could probably use a repeat node but whatever
    end),},
    { delimiters = "<>" }),
    { condition = in_mathzone--[[, show_condition = math--]] }
),

s({trig = "([%a|%}%]%)])(%d)%2",
dscr = "a00->a_0",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "pattern"}, fmta([[
<>_<>
]], {
    f(function(_, snip) return snip.captures[1] end),
    f(function(_, snip) return snip.captures[2] end)
}), {
    condition = in_mathzone
}),

s({trig = "(%a)_(%d%d)",
dscr = "a_00->a_{00}",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "pattern"},
    fmta(
        "<>_{<><>}",
        {
            f(function(_, snip) return snip.captures[1] end),
            f(function(_, snip) return snip.captures[2] end),
            i(0),
        }
    ),
    {condition = in_mathzone}
),

s({trig = "sr",
dscr = "^2",
snippetType = "autosnippet",
wordTrig = false,
regTrig = true
},
fmta(
    "^2",
    {}
),
{condition = in_mathzone}
),

s({trig = "cb",
dscr = "^3",
snippetType = "autosnippet",
wordTrig = false,
regTrig = true},
    fmta(
        "^3",{}
    ),
    {condition = in_mathzone}
),

s({trig = "td",
dscr = "^{}",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"
},
    fmta(
        "^{<>}",{i(0)}
    ),
    {condition = in_mathzone}
),

s({trig = "([%a%)])__", dscr = "_", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta(
    '<>_{<>}',
		{ f(function(_, snip) return snip.captures[1] end), i(1) }
  ),
  { condition = in_mathzone }
),
s({trig = "([%a%)])^^", dscr = "^", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta(
    '<>^{<>}',
		{ f(function(_, snip) return snip.captures[1] end), i(1) }
  ),
  { condition = in_mathzone }
),
s({trig = "qq", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta(
    " \\quad ",
		{ }
  ),
  { condition = in_mathzone }
),
s({trig = "tt", dscr = "text", snippetType = "autosnippet", wordTrig = false, regTrig = true},
  fmta(
    "\\text{<>}",
		{ i(0) }
  ),
  { condition = in_mathzone }
),


s({trig = "lim", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\lim",
        {nodes}
    ),
    {condition = in_mathzone}
),

s({trig = "to", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\to",
        {}
    ),
    { condition = in_mathzone }
),
s({trig = "mt", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\mapsto",
        {}
    ),
    { condition = in_mathzone }
),

s({trig = "dd", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\mathrm{d}<>",
        {i(0)}
    ),
    { condition = in_mathzone }
),

s({trig = "pt", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\partial",
        {}
    ),
    {condition = in_mathzone}
),

s({trig = "bar", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\bar",
        {}
    ),
    {condition = in_mathzone}
),

s({trig = "nb", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\nabla",
        {}
    ),
    {condition = in_mathzone}
),

s({trig = "bb", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\mathbf{<>}",
        {i(0)}
    ),
    {condition = in_mathzone}
),

s({trig = "vv", dscr = "description", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\boldsymbol{<>}",
        {i(0)}
    ),
    {condition = in_mathzone}
),

s({trig = "xx", dscr = "\\hat x", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\boldsymbol{\\hat x}",
        {}
    ),
    {condition = in_mathzone}
),

s({trig = "yy", dscr = "\\hat y", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\boldsymbol{\\hat y}",
        {}
    ),
    {condition = in_mathzone}
),

s({trig = "zz", dscr = "\\hat z", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\boldsymbol{\\hat z}",
        {}
    ),
    {condition = in_mathzone}
),

s({trig = "rr", dscr = "\\hat r", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\boldsymbol{\\hat r}",
        {}
    ),
    {condition = in_mathzone}
),

s({trig = "tt", dscr = "\\hat \\theta", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\boldsymbol{\\hat \\theta}",
        {}
    ),
    {condition = in_mathzone}
),


s({trig = "pp", dscr = "\\hat \\phi", snippetType = "autosnippet", wordTrig = false, regTrig = true},
    fmta(
        "\\boldsymbol{\\hat \\phi}",
        {}
    ),
    {condition = in_mathzone}
),

}
--f( function(_, snip) return snip.captures[1] end ),
