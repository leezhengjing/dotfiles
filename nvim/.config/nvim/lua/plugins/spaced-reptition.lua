local user = vim.env.USER
local vault_paths = {
	SIPSS0694 = vim.fn.expand("~/Library/CloudStorage/GoogleDrive-zhengjing.lee86@gmail.com/My Drive/Obsidian Brain"),
	leezhengjing = vim.fn.expand("~/Library/CloudStorage/GoogleDrive-zhengjing.lee86@gmail.com/My Drive/Obsidian Brain"),
}
local vault_path = vault_paths[user] or vim.fn.expand("~/Obsidian Brain")

return {
	"leezhengjing/obsidian-spaced-repetition.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("obsidian-spaced-repetition").setup({
			vault_path = vault_path,
			flashcard_tags = { "cs3211", "cs3212", "test" },
		})
	end,
	keys = {
		{ "<leader>or", "<cmd>ObsidianSRReview<cr>", desc = "Obsidian Spaced Repetition Review" },
		{ "<leader>orn", "<cmd>ObsidianSRReviewNote<cr>", desc = "Obsidian Spaced Repetition Single Note" },
	},
}
