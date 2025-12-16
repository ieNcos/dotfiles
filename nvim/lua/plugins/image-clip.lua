return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
      filetypes = {
          markdown = {
              template = [[|![]($FILE_PATH)|
|:--:|
|$CURSOR|]]
          },
          tex = {
              relative_template_path = false, ---@type boolean | fun(): boolean
              template = [[
\begin{figure}[H]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
]], ---@type string | fun(context: table): string

              formats = { "jpeg", "jpg", "png", "pdf" }, ---@type table
          },
      },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
