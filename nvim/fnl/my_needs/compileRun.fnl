(fn split []
  (vim.cmd "set splitbelow")
  (vim.cmd "sp")
  (vim.cmd "res -5")
)

(fn compileRun []
  (vim.cmd "w")
  (local ft vim.bo.filetype)
  (if
    (= ft "python")
      ((split)
       (vim.cmd "exec 'term python %'"))
    (= ft "a")
      ((split)
       (vim.cmd "exec 'term python %'"))
    (split))
)

(vim.keymap.set "n" "<F5>" compileRun {:silent true})
{: compileRun}
