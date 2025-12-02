return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			python = { "black" },
			swift = { "swiftformat" },
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				local conform = require("conform")
				if conform and conform.format then
					conform.format({ async = true })
				else
					vim.lsp.buf.format({ async = true })
				end
			end,
			desc = "Format buffer (Conform or LSP fallback)",
			mode = { "n", "v" },
		},
	},
}
