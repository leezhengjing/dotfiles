local user = vim.env.USER
local vault_paths = {
	SIPSS0694 = vim.fn.expand("~/Google Drive/Other computers/My Mac/Google Drive/Obsidian Brain"),
	leezhengjing = vim.fn.expand("/Users/leezhengjing/Documents/GDrive/Obsidian Brain"), -- TODO: Update this to your personal laptop's Obsidian path
}
local vault_path = vault_paths[user] or vim.fn.expand("~/Obsidian Brain")

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
				path = vault_path,
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
				require("mini.files").open(vault_path)
			end,
			desc = "Open Obsidian Vault (mini.files)",
		},
		{
			";or",
			function()
				local builtin = require("telescope.builtin")
				builtin.live_grep({
					cwd = vault_path,
				})
			end,
			desc = "Search Obsidian Vault (Content)",
		},
		{
			"<leader>oc",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({
					cwd = vault_path .. "/02 - Areas/Competitive Programming/everyquestionidid",
				})
			end,
			desc = "Search CP Notes",
		},
		{
			"<leader>ot",
			function()
				local builtin = require("telescope.builtin")
				builtin.find_files({
					cwd = vault_path .. "/99 - Meta",
					prompt_title = "Select Template",
					attach_mappings = function(prompt_bufnr, map)
						local actions = require("telescope.actions")
						local action_state = require("telescope.actions.state")
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							if selection then
								local template = selection[1]:gsub("%.md$", "")
								vim.schedule(function()
									vim.ui.input({ prompt = "Enter note title: " }, function(input)
										if input == nil or input == "" then
											return
										end
										local cmd = string.format(
											"Obsidian new_from_template %s %s",
											vim.fn.fnameescape(input),
											vim.fn.fnameescape(template)
										)
										vim.cmd(cmd)
									end)
								end)
							end
						end)
						return true
					end,
				})
			end,
			desc = "New Note from Template",
		},
		{
			"<leader>om",
			function()
				local builtin = require("telescope.builtin")
				local current_file = vim.fn.expand("%:p")
				if current_file == "" then
					vim.notify("No file open", vim.log.levels.WARN)
					return
				end
				local current_name = vim.fn.expand("%:t")
				builtin.find_files({
					cwd = vault_path,
					prompt_title = "Move to Directory",
					find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
					attach_mappings = function(prompt_bufnr, map)
						local actions = require("telescope.actions")
						local action_state = require("telescope.actions.state")
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							if selection then
								local target_dir = vault_path .. "/" .. selection[1]
								local new_file = target_dir .. "/" .. current_name
								vim.schedule(function()
									local success, err = os.rename(current_file, new_file)
									if success then
										vim.cmd("edit " .. vim.fn.fnameescape(new_file))
										vim.cmd("bdelete! " .. vim.fn.fnameescape(current_file))
										vim.notify("Moved to " .. target_dir)
									else
										vim.notify("Error moving file: " .. tostring(err), vim.log.levels.ERROR)
									end
								end)
							end
						end)
						return true
					end,
				})
			end,
			desc = "Move Note to Directory",
		},
	},
}
