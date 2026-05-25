return {
  "allaman/emoji.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    enable_cmp_integration = false,
  },
  config = function(_, opts)
    require("emoji").setup(opts)
    require("telescope").load_extension("emoji")
    vim.keymap.set("n", "<leader>se", "<cmd>Telescope emoji<cr>", { desc = "[S]earch [E]moji" })
  end,
}
