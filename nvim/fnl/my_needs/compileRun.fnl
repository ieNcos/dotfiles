(fn split []
  (vim.cmd "set splitbelow")
  (vim.cmd "sp")
  (vim.cmd "res -5")
)

(local split_command_dict {
  :python "term python %"
  :c      "term gcc % -o %< && ./%<"
  :cpp    "term g++ % -o %< && ./%<"
  :rust   "term cargo run"
  :zig    "term zig build run"
  :scheme "term steel %"
  :racket "term racket %"
  :lua    "term lua %"
  :fennel "term fennel %"
})
(local test_dict {
  :zig    "term zig build test"
  :lua    "term love ."
  :rust   "term cargo test"
})
(local command_dict {
  :typst "exec '!typst compile %'"
})

(fn compileRun []
  (vim.cmd "w")
  (local ft vim.bo.filetype)
  (if (. split_command_dict ft)
       (do
       (split)
       (vim.cmd (. split_command_dict ft)))
      (. command_dict ft)
       (vim.cmd (. command_dict ft))
  )
)
(fn compileTest []
  (vim.cmd "w")
  (local ft vim.bo.filetype)
  (if (. test_dict ft)
       (do
       (split)
       (vim.cmd (. test_dict ft)))
  )
)

(fn make []
  (vim.cmd "w")
  (vim.cmd "make"))

(vim.keymap.set "n" "<F5>" compileRun {:silent true})
(vim.keymap.set "n" "<F6>" compileTest {:silent true})
(vim.keymap.set "n" "<F4>" make {:silent false})
"""
计划：
SetMakeCommand
SetTestCommand
存储起来，再次调用的时候直接编辑原文
make
test
启动的时候默认default
一共4个键
唯一不确定能否实现的地方是编辑原文，别的应该都没问题
"""
