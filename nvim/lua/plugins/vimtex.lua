return {
    'lervag/vimtex',
    lazy = false,
    enabled = true,
    init = function ()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_view_general_viewer = 'zathura'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.text_conceal = 'abdmg'
        vim.g.tex_fast = 'M'
        vim.g.vimtex_latexmk_build_dir = 'build'
        vim.g.vimtex_compiler_latexmk = {
            aux_dir='build',
        }

        vim.g.vimtex_mappings_enabled = false
        --vim.g.vimtex_complete_enabled = 1
    end,
}
