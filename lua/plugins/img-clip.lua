return {
	"hakonharnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		default = {
			-- Match Obsidian workflow
			dir_path = "attachments",
			extension = "avif", ---@type string | fun(): string
			relative_to_current_file = true,
			use_absolute_path = false,
			prompt_for_file_name = true,
			show_dir_path_in_prompt = false,

			-- Process image with ImageMagick to avif
			process_cmd = "magick - -quality 75 avif:-",

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
