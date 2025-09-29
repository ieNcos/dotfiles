---@diagnostic disable: undefined-global
local function fn(
    args,     -- text from i(2) in this example i.e. { { "456" } }
    parent,   -- parent snippet or parent node
    user_args -- user_args from opts.user_args 
    )
    return '[' .. args[1][1] .. user_args .. ']'
end
local box1 = function (args, parent, user_args)
    local len = #args[1][1]
    local a = string.rep('─', len+2)
    return a
end
return {
s(
	{trig = "ii"},
	{t("Hello, world!")}
),


--'╭', '─', '╮', '│', '╯', '─', '╰', '│'

s({trig = "box1",
dscr = "box-1",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
╭<>╮
│ <> │
╰<>╯
]], {
    f(box1, {1}),
    i(1),
    f(box1, {1}),
}), {}),


s({trig = "#date",
dscr = "date",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
<>
]], {
    f(function ()
        local os = require "os"
        local date = os.time()
        return os.date("# %Y-%m-%d %A", date)
    end)
}), {}),

s({trig = "date",
dscr = "date",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
<>
]], {
    f(function ()
        local os = require "os"
        local date = os.time()
        return os.date("%Y-%m-%d", date)
    end)
}), {}),

s({trig = "time",
dscr = "time",
snippetType = "snippet",
wordTrig = true,
trigEngine = "plain"},fmta([[
<>
]], {
    f(function ()
        local os = require "os"
        local date = os.time()
        return os.date("%H:%M:%S", date)
    end)
}), {}),

s({ trig = "table(%d+)x(%d+)", regTrig = true }, {
    ---@diagnostic disable-next-line: unused-local
    d(1, function(args, snip)
      local nodes = {}
      local i_counter = 0
      local hlines = ""
      for _ = 1, snip.captures[2] do
        i_counter = i_counter + 1
        table.insert(nodes, t("| "))
        table.insert(nodes, i(i_counter, "Column" .. i_counter))
        table.insert(nodes, t(" "))
        hlines = hlines .. "|---"
      end
      table.insert(nodes, t({ "|", "" }))
      hlines = hlines .. "|"
      table.insert(nodes, t({ hlines, "" }))
      for _ = 1, snip.captures[1] do
        for _ = 1, snip.captures[2] do
          i_counter = i_counter + 1
          table.insert(nodes, t("| "))
          table.insert(nodes, i(i_counter))
          table.insert(nodes, t(" "))
        end
        table.insert(nodes, t({ "|", "" }))
      end
      return sn(nil, nodes)
    end),
  }),






}


