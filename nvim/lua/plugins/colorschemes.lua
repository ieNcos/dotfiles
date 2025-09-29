return {
    {
        "morhetz/gruvbox",
        enabled = true,
        config=function()
            vim.cmd([[
                "colorscheme gruvbox
                "set background=dark
                "set termguicolors
            ]])
        end
    },

    {
        'rebelot/kanagawa.nvim',
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
          require('kanagawa').setup {
            colors = {
              theme = {
                all = {
                  ui = {
                    bg_gutter = 'none',
                  },
                },
              },
            },
          }
          vim.cmd.colorscheme 'kanagawa'
          vim.api.nvim_set_hl(0, 'TermCursor', { fg = '#A6E3A1', bg = '#A6E3A1' })
        end,
    }
}
