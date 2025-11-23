-- [nfnl] fnl/my_needs/compileRun.fnl
local function split()
  vim.cmd("set splitbelow")
  vim.cmd("sp")
  return vim.cmd("res -5")
end
local split_command_dict = {python = "term python %", c = "term gcc % -o %< && ./%<", cpp = "term g++ % -o %< && ./%<", rust = "term cargo run", zig = "term zig build run", scheme = "term steel %", racket = "term racket %", lua = "term lua %", fennel = "term fennel %"}
local test_dict = {zig = "term zig build test", lua = "term love .", rust = "term cargo test"}
local command_dict = {typst = "exec '!typst compile %'"}
local function compileRun()
  vim.cmd("w")
  local ft = vim.bo.filetype
  if split_command_dict[ft] then
    split()
    return vim.cmd(split_command_dict[ft])
  elseif command_dict[ft] then
    return vim.cmd(command_dict[ft])
  else
    return nil
  end
end
local function compileTest()
  vim.cmd("w")
  local ft = vim.bo.filetype
  if test_dict[ft] then
    split()
    return vim.cmd(test_dict[ft])
  else
    return nil
  end
end
vim.keymap.set("n", "<F5>", compileRun, {silent = true})
vim.keymap.set("n", "<F6>", compileTest, {silent = true})
return {}
