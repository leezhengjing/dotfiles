return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    init = function()
      -- keep a file's preview tab open when switching buffers, so multiple
      -- files can each have their own preview tab open at the same time
      vim.g.mkdp_auto_close = 0
    end,
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
  },
}
