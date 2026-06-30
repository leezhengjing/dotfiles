return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
			{
				name = "Brain",
				path = "/Users/leezhengjing/Documents/GDrive/Obsidian Brain",
			},
		},
		notes_subdir = "06 - Fleeting",
		frontmatter = {
			enable = false,
		},
		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			local timestamp = os.date("%Y%m%d%H%M")
			-- If title is given, transform it into valid file name with timestamp prefix.
			if title ~= nil and title ~= "" then
				local slug = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				return string.format("%s-%s", timestamp, slug)
			end
			-- If title is nil, use the timestamp as a fallback.
			return timestamp
		end,

		-- Configure the default template for all new notes
		note = {
			template = "(TEMPLATE) Unique.md",
		},

		-- Configure daily notes
		daily_notes = {
			folder = "07 - Daily",
			date_format = "YYYYMMDD",
			alias_format = "%B %-d, %Y",
			template = "(TEMPLATE) Daily (Vanilla).md",
		},

		-- Configure templates
		templates = {
			folder = "99 - Meta",
			date_format = "YYYY-MM-DD",
			time_format = "HH:mm",
			substitutions = {
				-- This allows you to use {{yesterday}} in your templates
				yesterday = function()
					return os.date("%Y-%m-%d", os.time() - 86400)
				end,
				-- Add a helper for the complex daily title format
				daily_title = function()
					return os.date("%A, %B %d, %Y")
				end,
			},
			customizations = {
				["CP Question"] = {
					notes_subdir = "02 - Areas/Competitive Programming/everyquestionidid",
				},
			},
		},

		-- Use telescope for pickers
		picker = {
			name = "telescope.nvim",
		},
	},
	keys = {
		{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "New Unique Note" },
		{ "<leader>os", "<cmd>Obsidian quick_switch<cr>", desc = "Quick Switch Note" },
		{
			"<leader>ocp",
			function()
				vim.ui.input({ prompt = "Enter problem title: " }, function(input)
					if input == nil or input == "" then
						return
					end
					-- Use the standard Obsidian command with escaped input
					local cmd = string.format("Obsidian new_from_template %s CP\\ Question", vim.fn.fnameescape(input))
					vim.cmd(cmd)
				end)
			end,
			desc = "New CP Question",
		},
		{ "<leader>od", "<cmd>Obsidian today<cr>", desc = "Daily Note" },
		{ "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Yesterday's Daily Note" },
		{
			"<leader>oe",
			function()
				require("mini.files").open("/Users/leezhengjing/Documents/GDrive/Obsidian Brain")
			end,
			desc = "Open Obsidian Vault (mini.files)",
		},
		{
			";or",
			function()
				local builtin = require("telescope.builtin")
				builtin.live_grep({
					cwd = "/Users/leezhengjing/Documents/GDrive/Obsidian Brain",
				})
			end,
			desc = "Search Obsidian Vault (Content)",
		},
		{
			"<leader>oc",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({
					cwd = "/Users/leezhengjing/Documents/GDrive/Obsidian Brain/02 - Areas/Competitive Programming/everyquestionidid",
				})
			end,
			desc = "Search CP Notes",
		},
	},
}
