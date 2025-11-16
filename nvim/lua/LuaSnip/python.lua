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

s({trig = "headers",
dscr = "description",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams["font.family"] = "Source Han Serif"
]], {
    
}), {}),

s({trig = "nl",
dscr = "new block",
snippetType = "snippet",
wordTrig = false,
trigEngine = "plain"},fmta([[
# %%
<>
#%%
]], {
    i(0),
}), {}),
}
