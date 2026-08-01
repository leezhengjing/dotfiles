return {
	"r-pletnev/pdfreader.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("pdfreader").setup({
			-- You can add custom configuration here if needed
			-- default options usually suffice for ghostty + kitty graphics
		})
	end,
}
