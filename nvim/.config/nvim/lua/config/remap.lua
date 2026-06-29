vim.g.mapleader = " "
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "te", ":tabedit")
-- vim.keymap.set("n", "<tab>", ":tabnext<Return>")
-- vim.keymap.set("n", "<s-tab>", ":tabprev<Return>")
-- vim.keymap.set("n", "tw", ":tabclose<Return>")
--
vim.keymap.set("n", "ss", ":split<Return>")
vim.keymap.set("n", "sv", ":vsplit<Return>")

vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")

vim.keymap.set("n", "<leader>w<", "100<C-w>>")
vim.keymap.set("n", "<leader>w>", "100<C-w><")
vim.keymap.set("n", "<leader>wm", "<cmd>vertical resize 1<CR>")

vim.keymap.set("n", "<C-a>", "ggVG")

vim.keymap.set("n", "<leader>pb", function()
	local file_path = vim.api.nvim_buf_get_name(0)
	local script_path = "/Users/leezhengjing/Github/zj-portfolio/scripts/publish.mjs"
	local cmd = string.format("node %s '%s'", script_path, file_path)

	print("🚀 Publishing to zj-portfolio...")
	local output = vim.fn.system(cmd)
	print(output)
end, { desc = "Publish Blog Post" })

-- Quickly turn the current line into a Figure Caption
vim.keymap.set("n", "<leader>fc", function()
	local line = vim.api.nvim_get_current_line()
	-- Wrap in italics and add Figure prefix
	local new_line = "*Figure: " .. line .. "*"
	vim.api.nvim_set_current_line(new_line)
end, { desc = "Format line as Figure Caption" })

-- Quick shortcuts for closing buffers/windows
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit current window/buffer without saving" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Delete current buffer without saving" })
