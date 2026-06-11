return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  ft = { "markdown", "obsidian" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    -- Heading Navigation
    { "gj",        [[<cmd>lua require('render-markdown.api').heading_next()<cr>]], desc = "Next Heading" },
    { "gk",        [[<cmd>lua require('render-markdown.api').heading_prev()<cr>]], desc = "Previous Heading" },

    -- Task Management
    { "<leader>x", "<cmd>ObsidianToggleCheckbox<cr>",                              desc = "Toggle Checkbox" },

    -- Folds (Standard Vim behavior enhanced for MD)
    { "zk",        "zMzvzc",                                                       desc = "Fold Level 2 Headings" }, -- Fold all, then open current
    { "zl",        "zMzvzc",                                                       desc = "Fold Level 3 Headings" },
    { "zu",        "zR",                                                           desc = "Unfold All" },
  },
}
