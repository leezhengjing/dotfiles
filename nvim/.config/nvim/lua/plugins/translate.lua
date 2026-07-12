return {
	"uga-rosa/translate.nvim",
	config = function()
		require("translate").setup({
			default = {
				command = "google",
				output = "floating",
			},
		})

		vim.keymap.set("v", "<leader>tr", "<cmd>Translate EN<cr>", { desc = "Translate to English" })
		vim.keymap.set("n", "<leader>tr", "<cmd>Translate EN<cr>", { desc = "Translate line to English" })
	end,
}
