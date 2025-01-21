---@diagnostic disable: undefined-global
M = {

s({trig = "rect",
dscr = "description",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
#rect()[
<>
]
]], {
    i(0),
}), {}),


s({trig = "red",
dscr = "description",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
#text(red)[
<>
]
]], {
    i(0),
}), {}),


s({trig = "=date",
dscr = "date",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
<>
]], {
    f(function ()
        local os = require "os"
        local date = os.time()
        return os.date("= %Y-%m-%d %A", date)
    end)
}), {}),


s({trig = ",,",
dscr = "math env",
snippetType = "autosnippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
$<>$
]], {
    i(0)
}), {}),


}
return M
