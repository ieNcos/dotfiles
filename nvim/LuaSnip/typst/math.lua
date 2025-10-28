---@diagnostic disable: undefined-global
local in_mathzone = function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    local math = false;local string = false;
    for _, v in ipairs(result) do
        if v == "markup.math" then
            math = true
        end
        if v == "string" then
            string = true
        end
    end
    if math and not string then
        return true
    end
    return false
end

local not_in_mathzone = function()
    return not in_mathzone()
end

return
{

s({trig = ",,",
dscr = "math env",
snippetType = "autosnippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
$<>$
]], {
    i(0)
}), { condition = not_in_mathzone }),

s({trig = ",,",
dscr = "()",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
(<>)
]], {
    i(0)
}), { condition = in_mathzone }),

s({trig = ",.",
dscr = "display math",
snippetType = "autosnippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
$
<>
$
]], {
    i(0)
}), { condition = not_in_mathzone }),

s({trig = "//",
dscr = "并联",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
\/\/<>
]], {
    i(0)
}), {condition = in_mathzone}),

s({trig = "sp",
dscr = "^()",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
^(<>)
]], {
    i(0)
}), { condition = in_mathzone }),

s({trig = "sb",
dscr = "_()",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
_(<>)
]], {
    i(0),
}), { condition = in_mathzone }),

s({trig = "sq",
dscr = "square ^2",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
^2<>
]], {
    i(0)
}), { in_mathzone }),

s({trig = "sr",
dscr = "square root sqrt",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
sqrt(<>)
]], {
    i(0)
}), { in_mathzone }),

s({trig = "cb",
dscr = "cubic",
snippetType = "autosnippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
^3
]], {

}), {in_mathzone}),

-- s({trig = "--",
-- dscr = "_",
-- snippetType = "autosnippet",
-- wordTrig = false,
-- trigEngine = "plain"},fmta([[
-- _<>
-- ]], {
--     i(0)
-- }), { condition = in_mathzone }),

-- s({trig = "==",
-- dscr = "^",
-- snippetType = "autosnippet",
-- wordTrig = false,
-- trigEngine = "plain"},fmta([[
-- ^<>
-- ]], {
--     i(0)
-- }), { condition = in_mathzone }),


}
