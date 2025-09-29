---@diagnostic disable: undefined-global
return {
s({trig = "comment",
dscr = "commentblock",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
##<>
## <>
##<>
]], {
    f(function (args, parent, user_args)
        local len = #args[1][1]
        local a = string.rep('#', len+1)
        return a
    end, {1}),
    i(1),
    f(function (args, parent, user_args)
        local len = #args[1][1]
        local a = string.rep('#', len+1)
        return a
    end, {1}),
}), {}),
}
