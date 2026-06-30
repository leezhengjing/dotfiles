return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{ "<leader>ih", function() Snacks.image.hover() end, desc = "Hover image preview" },
		{
			"<leader>iH",
			function()
				local cfg = Snacks.image.config.doc
				local orig_w, orig_h = cfg.max_width, cfg.max_height
				cfg.max_width, cfg.max_height = 200, 100
				Snacks.image.hover()
				cfg.max_width, cfg.max_height = orig_w, orig_h
			end,
			desc = "Zoom image preview",
		},
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		image = {
			enabled = true,
			doc = {
				inline = true,
				math = true,
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
