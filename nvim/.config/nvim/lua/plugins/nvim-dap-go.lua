return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dap-go").setup()
	end,
	keys = {
		{ "<leader>dg", function() require("dap-go").debug_test() end, ft = "go", desc = "Debug nearest Go test" },
		{ "<leader>dG", function() require("dap-go").debug_last_test() end, ft = "go", desc = "Debug last Go test" },
	},
}
