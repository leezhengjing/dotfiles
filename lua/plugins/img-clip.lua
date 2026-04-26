return {
	"hakonharnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		default = {
			-- Match Obsidian workflow
			dir_path = "attachments",
			extension = "png", ---@type string | fun(): string
			relative_to_current_file = true,
			use_absolute_path = false,
			prompt_for_file_name = false, -- Set to false since we are using a custom function
			show_dir_path_in_prompt = false,

			-- Custom filename prompt with space-to-hyphen sanitization
			file_name = function()
				local name = vim.fn.input("Enter image name: ")
				if name == "" then
					return os.date("%Y-%m-%d-%H-%M-%S")
				end
				return name:gsub("%s+", "-")
			end,

			-- Use default PNG saving (no lossy compression)
			process_cmd = nil,

			-- Drag and drop
			drag_and_drop = {
				enabled = true,
				insert_mode = true,
			},
		},
		filetypes = {
			markdown = {
				url_encode_path = true,
				template = "![$CURSOR]($FILE_PATH)",
				download_images = false,
			},
		},
	},
	keys = {
		{ "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
	},
}
