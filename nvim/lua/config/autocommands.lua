vim.api.nvim_create_autocmd( 'FileType', { pattern = {"clojure", "python", "rust", "c", "lua", "cpp", "fish", "markdown", "haskell", "latex"},
    callback = function ()
        vim.treesitter.start()
    end
})
vim.api.nvim_create_autocmd( 'FileType', { pattern = "lua",
    callback = function ()
        vim.cmd([[
        syntax match index "wordTrig = " conceal
        syntax match index "snippetType = " conceal
        syntax match index "trigEngine = " conceal
        syntax match index "trig = " conceal
        syntax match index "dscr = " conceal
        ]])
    end
})

vim.api.nvim_create_autocmd( 'FileType', { pattern = {"tex", "latex"},
    callback = function ()
        vim.cmd([[
        syntax match index "oldsymbol" conceal
        ]])
    end
}) --没有用，对数学环境里的东西没有用，对数学环境外的才有效。
