local animals = require('misc.style').animals
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = ""

vim.cmd([[ highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE ]])
vim.o.cursorline = true

vim.o.signcolumn = "auto"

-- vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20"
-- ver25

vim.opt.foldmethod = "marker"

local tabsize = 4
-- Tab -> space.
-- C-v Tab -> Tab
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.tabstop = tabsize
vim.o.shiftwidth = tabsize
vim.o.softtabstop = tabsize

vim.o.conceallevel = 0
vim.o.history = 1000

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.g.python_host_prog="ipython"

vim.cmd([[
au InsertLeave *.tex write
]])
vim.cmd([[
set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
]])
vim.cmd([[
highlight Normal guibg=NONE ctermbg=NONE
]])

--{{{ statusline
vim.cmd [[
let g:currentmode={
       \ 'n'  : '%#String# NORMAL ',
       \ 'v'  : '%#Search# VISUAL ',
       \ 's'  : '%#ModeMsg# VISUAL ',
       \ "\<C-V>" : '%#Title# V·Block ',
       \ 'V'  : '%#IncSearch# V·Line ',
       \ 'Rv' : '%#String# V·Replace ',
       \ 'i'  : '%#ModeMsg# INSERT ',
       \ 'R'  : '%#Substitute# R ',
       \ 'c'  : '%#CurSearch# Command ',
       \ 't'  : '%#ModeMsg# TERM ',
       \}
]]

math.randomseed(os.time())
local i = math.random(#animals)
vim.opt.statusline = '%{%g:currentmode[mode()]%} %{%reg_recording()%} %* %t | %y | %* %= c:%c l:%l/%L %p%% %#NonText# ' .. animals[i] .. ' %*'
--}}}

vim.opt.cmdheight = 1
