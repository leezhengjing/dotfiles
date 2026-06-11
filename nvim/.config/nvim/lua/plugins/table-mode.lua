return {
  "dhruvasagar/vim-table-mode",
  event = "VeryLazy",
  init = function()
    -- Set corner for Markdown-compatible tables
    vim.g.table_mode_corner = "|"
  end,
}
