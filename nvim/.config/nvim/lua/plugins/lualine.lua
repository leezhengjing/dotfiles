return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "gruvbox",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				},
			},
			lualine_b = {
				{
					"diff",
					symbols = { added = "+", modified = "~", removed = "-" },
				},
			},
			lualine_x = {
				{
					"diagnostics",
					symbols = { error = "E", warn = "W", info = "I", hint = "H" },
				},
			},
			lualine_z = {
				{
					"location",
					fmt = function(str)
						return str .. " ☰ %L"
					end,
				},
			},
		},
	},
}
