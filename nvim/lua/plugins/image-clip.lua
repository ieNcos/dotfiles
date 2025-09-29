return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
      filetypes = {
          markdown = {
              template = [[|![]($FILE_PATH)|
|:--:|
|$CURSOR|]]
          }
      }
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
