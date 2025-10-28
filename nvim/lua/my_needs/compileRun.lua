-- [nfnl] fnl/my_needs/compileRun.fnl
local function split()
  vim.cmd("set splitbelow")
  vim.cmd("sp")
  return vim.cmd("res -5")
end
local function compileRun()
  vim.cmd("w")
  local ft = vim.bo.filetype
  if (ft == "python") then
    return split()(vim.cmd("exec 'term python %'"))
  elseif (ft == "a") then
    return split()(vim.cmd("exec 'term python %'"))
  else
    return split()
  end
end
vim.keymap.set("n", "<F5>", compileRun, {silent = true})
return {compileRun = compileRun}
