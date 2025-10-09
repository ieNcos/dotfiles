return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function ()
        ---@diagnostic disable-next-line: missing-fields
        -- local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
        -- vim.fn.mkdir(parser_install_dir, "p")
        require('nvim-treesitter.configs').setup {
            parser_install_dir = parser_install_dir,
            auto_install = false,
            ensure_installed = {
                'bash',
                'c',
                'cpp',
                'fish',
                'haskell',
                'markdown',
                'lua',
                'python',
                'rust',
                'scheme',
                'vim',
                'norg',
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
