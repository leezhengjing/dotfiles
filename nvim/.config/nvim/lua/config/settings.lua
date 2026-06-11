-- ========================================================================== --
--                           EDITOR SETTINGS                            --
-- ========================================================================== --

local orig_inlay_hint_handler = vim.lsp.handlers["textDocument/inlayHint"]

vim.lsp.handlers["textDocument/inlayHint"] = function(err, result, ctx, config)
	local client = vim.lsp.get_client_by_id(ctx.client_id)

	-- Drop ALL inlay hints from clangd (they cause invalid extmarks)
	if client and client.name == "clangd" then
		return
	end

	-- Keep inlay hints for every other LSP
	if orig_inlay_hint_handler then
		return orig_inlay_hint_handler(err, result, ctx, config)
	end
end
vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.autoread = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.conceallevel = 2

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.updatetime = 50

vim.o.colorcolumn = "80"

vim.g.mapleader = " "

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.timeoutlen = 300

vim.o.foldmethod = "manual"

-- Disable autoformat for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "obsidian" },
	callback = function()
		vim.b.autoformat = false
		-- Only override <leader>w for markdown to allow manual "safe" save
		vim.keymap.set("n", "<leader>w", "<cmd>noa w<cr>", { buffer = true, desc = "Save without formatting" })
	end,
})

-- Basic clipboard interaction
vim.keymap.set({ "n", "x" }, "gy", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "x" }, "gp", '"+p', { desc = "Paste clipboard content" })
