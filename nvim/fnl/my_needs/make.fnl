(fn set_makeprg [cmd]
  (set vim.opt_local.makeprg cmd)
  (print (.. "compile command is set as " cmd))
)

(vim.api.nvim_create_user_command
  "SetCompileCommand"
  (fn [opts] (set_makeprg opts.args))
  {:nargs "*" :desc "compile command"})
