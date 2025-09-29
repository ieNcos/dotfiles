return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    -- vim.g.mkdp_filetypes = { "markdown" }
    -- vim.g.mkdp_browser = { "firefox" }
    vim.keymap.set('n', '<leader>ll', '<Cmd>MarkdownPreview<CR>')
  end,
  ft = { "markdown" },
}
