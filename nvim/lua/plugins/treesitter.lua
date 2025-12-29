return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
        local ts = require('nvim-treesitter')
        ts.setup {
            install_dir = vim.fn.stdpath('data') .. '/site'
        }
        ts.install{
            'c3',
            'rust',
            'c',
            'python',
            'lua',
            'fennel',
            'typst'
        }
    end
}
