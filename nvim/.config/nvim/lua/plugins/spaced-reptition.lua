return {
	"leezhengjing/obsidian-spaced-repetition.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("obsidian-spaced-repetition").setup({
			vault_path = "/Users/leezhengjing/Documents/GDrive/Obsidian Brain",
			flashcard_tags = { "cs3211", "cs3212", "test" },
		})
	end,
	keys = {
		{ "<leader>or", "<cmd>ObsidianSRReview<cr>", desc = "Obsidian Spaced Repetition Review" },
		{ "<leader>orn", "<cmd>ObsidianSRReviewNote<cr>", desc = "Obsidian Spaced Repetition Single Note" },
	},
}
