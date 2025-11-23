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

(vim.keymap.set "n" "<F5>" compileRun {:silent true})
(vim.keymap.set "n" "<F6>" compileTest {:silent true})
{}
