-- [nfnl] fnl/my_needs/make.fnl
local function set_makeprg(cmd)
  vim.opt_local.makeprg = cmd
  return print(("compile command is set as " .. cmd))
end
local function _1_(opts)
  return set_makeprg(opts.args)
end
return vim.api.nvim_create_user_command("SetCompileCommand", _1_, {nargs = "*", desc = "compile command"})
