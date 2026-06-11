return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
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
				"<C-p>",
				function()
					local builtin = require("telescope.builtin")
					builtin.git_files()
				end,
				desc = "Telescope git find files",
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
			{
				";/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Fuzzy search in current buffer",
			},
			{
				"<leader>ve",
				function()
					vim.cmd("edit $MYVIMRC")
				end,
				desc = "Edit Neovim Config",
			},
			{
				"<leader>vf",
				function()
					require("telescope.builtin").find_files({
						cwd = vim.fn.stdpath("config"),
					})
				end,
				desc = "Find Neovim Config Files",
			},
		},
	},
}
