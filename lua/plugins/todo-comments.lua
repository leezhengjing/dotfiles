return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- Your configuration comes here
		-- or leave it empty to use the default settings
	},
	keys = {
		{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todo Comments" },
		{ "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
		{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
	},
}
