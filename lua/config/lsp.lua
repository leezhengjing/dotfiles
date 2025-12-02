vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufmap = function(mode, rhs, lhs)
			vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
		end

		-- These keymaps are the defaults in Neovim v0.11
		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
		bufmap("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>")
		bufmap("n", "gri", "<cmd>lua vim.lsp.juf.implementation()<cr>")
		bufmap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>")
		bufmap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
		bufmap({ "i", "s" }, "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

		-- Additional keymaps for compatibility
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		bufmap({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
		bufmap("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>")
		bufmap("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>")
		bufmap("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>")
		bufmap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
		-- Diagnostic navigation
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

vim.lsp.enable({
	"luals",
	"pyright",
	"ocamllsp",
	"vtsls",
	"marksman",
	"eslint",
	"mdx_analyzer",
	"clangd",
	"sourcekit",
})
