return {
	-- {
	-- 	"sainnhe/sonokai",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.sonokai_enable_italic = true
	-- 		vim.cmd.colorscheme("sonokai")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.nightfox_enable_italic = true
	-- 		vim.cmd.colorscheme("terafox")
	-- 	end,
	-- },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- vim.o.background = "light"
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
