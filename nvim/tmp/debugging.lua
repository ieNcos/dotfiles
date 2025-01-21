return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            'nvim-neotest/nvim-nio',
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-dap-python',
            'theHamsta/nvim-dap-virtual-text',
        },

        config = function()
            --vim.fn.sign_define('DapBreakpoint', { text = '🦆', texthl = '', linehl = '', numhl = '' })
            vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
            local dap = require 'dap'
            local ui = require 'dapui'
            require('dapui').setup()
            require('dap-python').setup()
            require('dap.ext.vscode').load_launchjs 'launch.json'

            require('nvim-dap-virtual-text').setup {
                -- Hides tokens, secrets, and other sensitive information
                -- From TJ DeVries' config
                -- Not necessary, but also can't hurt
                display_callback = function(variable)
                    local name = string.lower(variable.name)
                    local value = string.lower(variable.value)
                    if name:match 'secret' or name:match 'api' or value:match 'secret' or value:match 'api' then
                        return '*****'
                    end

                    if #variable.value > 15 then
                        return ' ' .. string.sub(variable.value, 1, 15) .. '... '
                    end

                    return ' ' .. variable.value
                end,
            }

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
        keys = {
            { '<leader>db', ":lua require'dap'.toggle_breakpoint()<cr>", desc = 'debug [b]reakpoint' },
            { '<leader>dc', ":lua require'dap'.continue()<cr>",          desc = 'debug [c]ontinue' },
            { '<leader>do', ":lua require'dap'.step_over()<cr>",         desc = 'debug [o]ver' },
            { '<leader>dO', ":lua require'dap'.step_out()<cr>",          desc = 'debug [O]ut' },
            { '<leader>di', ":lua require'dap'.step_into()<cr>",         desc = 'debug [i]nto' },
            { '<leader>dr', ":lua require'dap'.repl_open()<cr>",         desc = 'debug [r]epl' },
            { '<leader>du', ":lua require'dapui'.toggle()<cr>",          desc = 'debug [u]i' },
        },
    },
}
