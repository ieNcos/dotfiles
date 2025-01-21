return {
s({trig = "dm",
dscr = "display math",
snippetType = "autosnippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
$$<>$$
]], {
    i(0),
}), {}),

s({trig = "mm",
dscr = "description",
snippetType = "autosnippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
$<>$
]], {
    i(0),
}), {}),

s({trig = "graph",
dscr = "insert graph",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
![<>](<>)
]],{
    i(1),
    i(0),
}), {}),




}
