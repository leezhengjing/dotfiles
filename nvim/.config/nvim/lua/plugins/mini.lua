return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("mini.icons").setup({})

			-- Text objects
			require("mini.ai").setup({ n_lines = 500 })

			-- Comments
			require("mini.comment").setup({})

			-- Surround
			require("mini.surround").setup({})

			-- Color Highlights
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})

			-- Notifications
			local mini_notify = require("mini.notify")
			mini_notify.setup({
				lsp_progress = { enable = false },
			})
			vim.notify = mini_notify.make_notify({})

			-- Buffer management
			require("mini.bufremove").setup({})
			vim.keymap.set("n", "<leader>bc", "<cmd>lua pcall(MiniBufremove.delete)<cr>", { desc = "Close buffer" })

			-- File explorer
			local mini_files = require("mini.files")
			mini_files.setup({})

			-- Toggle file explorer
			vim.keymap.set("n", "<leader>e", function()
				if mini_files.close() then
					return
				end
				mini_files.open()
			end, { desc = "File explorer" })

			-- Fuzzy finder (Mini.pick)
			require("mini.pick").setup({})

			-- Fuzzy finder keymaps
			vim.keymap.set("n", "<leader>?", "<cmd>Pick oldfiles<cr>", { desc = "Search file history" })
			vim.keymap.set("n", "<leader><space>", "<cmd>Pick buffers<cr>", { desc = "Search open files" })
			vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Search all files" })
			vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<cr>", { desc = "Search in project" })
			vim.keymap.set("n", "<leader>fd", "<cmd>Pick diagnostic<cr>", { desc = "Search diagnostics" })
			vim.keymap.set("n", "<leader>fs", "<cmd>Pick buf_lines<cr>", { desc = "Buffer local search" })

			-- Statusline
			local mini_statusline = require("mini.statusline")

			local function statusline()
				local mode, mode_hl = mini_statusline.section_mode({ trunc_width = 120 })
				local diagnostics = mini_statusline.section_diagnostics({ trunc_width = 75 })
				local lsp = mini_statusline.section_lsp({ icon = "LSP", trunc_width = 75 })
				local filename = mini_statusline.section_filename({ trunc_width = 140 })
				local percent = "%2p%%"
				local location = "%3l:%-2c"

				return mini_statusline.combine_groups({
					{ hl = mode_hl, strings = { mode } },
					{ hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp } },
					"%<", -- Mark general truncate point
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%=", -- End left alignment
					{ hl = "MiniStatuslineFilename", strings = { "%{&filetype}" } },
					{ hl = "MiniStatuslineFileinfo", strings = { percent } },
					{ hl = mode_hl, strings = { location } },
				})
			end

			mini_statusline.setup({
				content = { active = statusline },
			})

			-- Extra features
			require("mini.extra").setup({})

			-- Snippets
			require("mini.snippets").setup({})
		end,
	},
}
