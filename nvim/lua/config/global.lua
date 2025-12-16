-- [nfnl] fnl/config/global.fnl
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.history = 10000
vim.g.python_host_prog = "ipython"
vim.opt.foldmethod = "marker"
vim.opt.conceallevel = 0
local tabsize = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.softtabstop = tabsize
vim.opt.list = true
vim.opt.listchars = {tab = "\194\187 ", trail = "\194\183", nbsp = "\226\144\163"}
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.cmd("\nlet g:currentmode={\n      \\  'n'  : '%#String# NORMAL ',\n      \\  'v'  : '%#Search# VISUAL ',\n      \\  's'  : '%#ModeMsg# VISUAL ',\n      \\  '\22' : '%#Title# V\194\183Block ',\n      \\  'V'  : '%#IncSearch# V\194\183Line ',\n      \\  'Rv' : '%#String# V\194\183Replace ',\n      \\  'i'  : '%#ModeMsg# INSERT ',\n      \\  'R'  : '%#Substitute# R ',\n      \\  'c'  : '%#CurSearch# Command ',\n      \\  't'  : '%#ModeMsg# TERM '}")
local animals = require("misc.style").animals
math.randomseed(os.time())
local i = math.random(#animals)
vim.o.statusline = ("%{%g:currentmode[mode()]%} %{%reg_recording()%} %* %t | %y | %* %= c:%c l:%l/%L %p%% %#NonText# " .. animals[i] .. " %*")
vim.o.cmdheight = 1
return vim.cmd("set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030")
