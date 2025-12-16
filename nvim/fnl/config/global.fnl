(set vim.opt.number true)
(set vim.opt.relativenumber true)
(set vim.opt.mouse "")
(set vim.opt.history 10000)
(set vim.g.python_host_prog "ipython")
(set vim.opt.foldmethod "marker")
(set vim.opt.conceallevel 0)

;; {{{ tab
(local tabsize 4)
;; Tab -> space
;; C-v Tab -> Tab
(set vim.opt.expandtab true)
(set vim.opt.smarttab true)
(set vim.opt.tabstop tabsize)
(set vim.opt.shiftwidth tabsize)
(set vim.opt.softtabstop tabsize)
(set vim.opt.list true)
(set vim.opt.listchars { :tab "» " :trail "·" :nbsp "␣" })
(set vim.opt.smartindent true)
(set vim.opt.breakindent true)
;; }}}

; {{{ statusline and cmdline
(vim.cmd "
let g:currentmode={
      \\  'n'  : '%#String# NORMAL ',
      \\  'v'  : '%#Search# VISUAL ',
      \\  's'  : '%#ModeMsg# VISUAL ',
      \\  '' : '%#Title# V·Block ',
      \\  'V'  : '%#IncSearch# V·Line ',
      \\  'Rv' : '%#String# V·Replace ',
      \\  'i'  : '%#ModeMsg# INSERT ',
      \\  'R'  : '%#Substitute# R ',
      \\  'c'  : '%#CurSearch# Command ',
      \\  't'  : '%#ModeMsg# TERM '}")
(local animals (. (require :misc.style) "animals"))
(math.randomseed (os.time))
(local i (math.random (length animals)))
(set vim.o.statusline (.. "%{%g:currentmode[mode()]%} %{%reg_recording()%} %* %t | %y | %* %= c:%c l:%l/%L %p%% %#NonText# " (. animals i) " %*"))
(set vim.o.cmdheight 1)
;; }}}

(vim.cmd "set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030")
