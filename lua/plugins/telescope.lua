return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>pf",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files()
				end,
				desc = "List files in current working directory",
			},
			{
				"<C-p>",
				function()
					local builtin = require("telescope.builtin")
					builtin.git_files()
				end,
				desc = "Telescope git find files",
			},
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
				end,
				desc = "Lists files in your current working directory, respects .gitignore",
			},
			{
				"<leader>ps",
				function()
					local builtin = require("telescope.builtin")
					builtin.grep_string({ search = vim.fn.input("Grep > ") })
				end,
				desc = "Grep string",
			},
			{
				";r",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep()
				end,
				desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
			},
			{
				"\\\\",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "Lists open buffers",
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
				desc = "Resume the previous telescope picker",
			},
			{
				";e",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "Lists Diagnostics for all open buffers or a specific buffer",
			},
			{
				";s",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
				desc = "Lists Function names, variables, from Treesitter",
			},
		},
	},
}
