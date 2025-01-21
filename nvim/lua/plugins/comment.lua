return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function ()
        ---@diagnostic disable-next-line: missing-fields
        require 'Comment'.setup({
        ---@diagnostic disable-next-line: missing-fields
            toggler = { line = "<c-c>" },
            opleader = { line = "<c-c>", block = "gb" },
        })
    end
}
