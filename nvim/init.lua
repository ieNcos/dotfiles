require('config.lazy')
require('config.global')
require('config.keymap')
require('config.autocommands')

---- 在 init.lua 中添加以下内容
--
---- 定义一个函数来设置左括号的高亮
--local function setup_bracket_highlight()
--  -- 设置红色的高亮组
--  vim.api.nvim_set_hl(0, 'RedBrackets', { fg = '#ff0000' })
--
--  -- 使用正则表达式匹配所有左括号，并为它们设置红色高亮
--  vim.api.nvim_exec([[syntax match RedBrackets /[\[({<]/]], false)
--end
--
---- 在启动Neovim时调用该函数
--setup_bracket_highlight()
