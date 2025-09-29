---@diagnostic disable: undefined-global
local in_mathzone = function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    for _, v in ipairs(result) do
        if v == "markup.math" then
            -- vim.notify("yes")
            return true
        end
    end
    -- vim.notify("no")
    return false
end

local map = {
    alpha = "al",
    beta = "be",
    gamma = "ga",
    delta = "de",
    epsilon = "ep",
    zeta = "ze",
    eta = "et",
    theta = "th",
    iota = "io",
    kappa = "kp",
    lambda = "la",
    mu = "mu",
    nu = "nu",
    xi = "xi",
    omicron = "om",
    pi = "pi",
    rho = "rh",
    sigma = "si",
    tau = "ta",
    upsilon = "up",
    phi = "ph",
    chi = "ch",
    psi = "ps",
    omega = "om",

    ea = "epsilon.alt",
    ba = "beta.alt",
    ka = "kappa.alt",
    pa = "phi.alt",
    sa = "sigma.alt",
}

local map2= {
    alpha = ";a",
    beta = ";b",
    gamma = ";g",
    delta = ";d",
    epsilon = ";ep",
    zeta = ";z",
    eta = ";et",
    theta = ";th",
    iota = ";i",
    kappa = ";k",
    lambda = ";l",
    mu = ";m",
    nu = ";n",
    xi = ";x",
    omicron = ";o",
    pi = "pi",
    rho = ";r",
    sigma = ";s",
    tau = ";ta",
    upsilon = ";u",
    phi = ";ph",
    chi = ";c",
    psi = ";ps",
    omega = ";o",

    ["epsilon.alt"] = "ea",
    ["beta.alt"] = "ba",
    ["kappa.alt"] = "ka",
    ["phi.alt"] = "pa",
    ["sigma.alt"] = "sa",
}

local Map = {}
local ucfirst = function (str)
    return string.gsub(str, "^%l", string.upper)
end
for k, v in pairs(map) do
    Map[ucfirst(k)] = ucfirst(v)
end


--##################
--## table to return
--##################
local M = {}
for k, v in pairs(map) do
    --print(k, v)
    table.insert(M,  s({trig = v, snippetType = "autosnippet", wordTrig = true},  fmta(k, {}), {condition = in_mathzone}))
end

for k, v in pairs(map2) do
    --print(k, v)
    table.insert(M,  s({trig = v, snippetType = "autosnippet", wordTrig = false}, fmta(k, {}), {condition = in_mathzone}))
end

for k, v in pairs(Map) do
    --print(k, v)
    table.insert(M,  s({trig = v, snippetType = "autosnippet", wordTrig = true},  fmta(k, {}), {condition = in_mathzone}))
end

return M
