return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("fzf-lua").setup({
            vim.keymap.set("n", "<C-h>", ":FzfLua files cwd=\"\"<left>~/",
                { noremap = true }),
            vim.keymap.set("n", "<C-x><C-f>",
                function () require("fzf-lua").files() end),
            vim.keymap.set({ "i" }, "<C-x><C-f>",
                function()
                    require("fzf-lua").complete_file({
                        cmd = "rg --files",
                        winopts = { preview = { hidden = "nohidden" } }
                    })
                end, { silent = true, desc = "Fuzzy complete file" }
            )
        })
    end
}
