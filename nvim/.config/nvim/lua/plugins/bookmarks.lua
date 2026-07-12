local function show_annotation_float(text)
	-- word-wrap at 60 chars
	local wrapped = {}
	for _, raw_line in ipairs(vim.split(text, "\n")) do
		local words = vim.split(raw_line, " ")
		local current = ""
		for _, word in ipairs(words) do
			if #current + #word + 1 > 60 then
				table.insert(wrapped, "  " .. current)
				current = word
			else
				current = current == "" and word or (current .. " " .. word)
			end
		end
		if current ~= "" then table.insert(wrapped, "  " .. current) end
	end

	local width = 0
	for _, line in ipairs(wrapped) do
		width = math.max(width, vim.fn.strdisplaywidth(line) + 2)
	end
	width = math.min(math.max(width, 20), 70)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, wrapped)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "cursor",
		width = width,
		height = #wrapped,
		row = 1,
		col = 0,
		style = "minimal",
		border = "rounded",
	})
	vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
	vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
	vim.api.nvim_create_autocmd("WinLeave", {
		once = true,
		callback = function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
		end,
	})
end

return {
	"tomasky/bookmarks.nvim",
	config = function()
		local bm = require("bookmarks")
		bm.setup({
			save_file = vim.fn.expand("~/.local/share/nvim/bookmarks"),
			virt_text = true,
			keywords = {
				["@t"] = "☑ ",
				["@w"] = "⚠ ",
				["@f"] = "⚑ ",
				["@n"] = " ",
			},
		})

		vim.keymap.set("n", "<leader>mm", bm.bookmark_toggle, { desc = "Toggle bookmark" })
		vim.keymap.set("n", "<leader>mi", bm.bookmark_ann, { desc = "Add/edit annotation" })
		vim.keymap.set("n", "<leader>mc", bm.bookmark_clean, { desc = "Clean bookmarks in buffer" })
		vim.keymap.set("n", "<leader>mn", bm.bookmark_next, { desc = "Next bookmark" })
		vim.keymap.set("n", "<leader>mP", bm.bookmark_prev, { desc = "Prev bookmark" })
		vim.keymap.set("n", "<leader>mL", bm.bookmark_list, { desc = "List all bookmarks" })

		vim.keymap.set("n", "<leader>mv", function()
			local cfg = require("bookmarks.config").config
			local filename = vim.fn.expand("%:p")
			local line = tostring(vim.fn.line("."))
			local file_marks = cfg.cache and cfg.cache.data and cfg.cache.data[filename]
			local mark = file_marks and file_marks[line]
			local annotation = mark and mark.a
			if not annotation or annotation == "" then
				vim.notify("No annotation on this line", vim.log.levels.INFO)
				return
			end
			show_annotation_float(annotation)
		end, { desc = "View bookmark annotation" })
	end,
}
