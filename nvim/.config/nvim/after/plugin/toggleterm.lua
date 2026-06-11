require("toggleterm").setup({
	size = 20,
	hide_numbers = true,
	open_mapping = [[<C-\>]],
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 0.3,
	start_in_insert = true,
	persist_size = true,
	direction = "float",
	shell = "/opt/homebrew/bin/fish",
	winbar = {
		enabled = false,
		name_formatter = function(term)
			return term.name
		end,
	},
})

-- Open a brand new floating terminal
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("ToggleTerm direction=float")
end, { desc = "New floating terminal" })

-- 2️⃣ Jump to terminals 1-9 easily
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, i .. "ToggleTerm", { desc = "Toggle terminal " .. i })
end

-- Better terminal keymaps
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	-- Press <Esc> to exit terminal insert mode
	local term = vim.api.nvim_buf_get_name(0)
	if not term:match("lazygit") then
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
	end
	-- Extra: quick window navigation with Ctrl-h/j/k/l
	vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
	vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
	vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
	vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
