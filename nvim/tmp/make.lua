    -- M.set_makeprg 函数：用于设置当前缓冲区的 makeprg 选项
local function set_makeprg(cmd)
    -- 使用 vim.opt_local 来确保设置只针对当前文件生效
    vim.opt_local.makeprg = cmd
    print('✅ 编译命令已设置为: ' .. cmd)
end

-- 创建 :SetCmd 用户命令
vim.api.nvim_create_user_command(
    'SetCmd', -- 您可以在命令行中输入的命令名称
    function(opts)
        -- opts.args 包含了用户在命令行中输入的所有文本，空格无需转义
        set_makeprg(opts.args)
    end,
    {
        nargs = '*', -- 接受 0 个或多个参数（即您的整个编译命令字符串）
        desc = '为当前文件设置编译命令，无需反斜杠转义。',
    }
)
