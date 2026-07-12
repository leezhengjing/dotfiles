return {
	cmd = { "vtsls", "--stdio" },
	init_options = {
		hostInfo = "neovim",
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = {
		vtsls = {
			-- Use workspace's own TypeScript so project tsconfig (including jsx option) is respected
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = { enableServerSideFuzzyMatch = true },
			},
		},
		typescript = {
			-- Fallback for files not covered by any tsconfig (implicit project)
			preferences = {
				implicitProjectConfig = { jsx = "react" },
			},
			updateImportsOnFileMove = { enabled = "always" },
			suggest = { completeFunctionCalls = true },
		},
		javascript = {
			preferences = {
				implicitProjectConfig = { jsx = "react" },
			},
			updateImportsOnFileMove = { enabled = "always" },
			suggest = { completeFunctionCalls = true },
		},
	},
	root_dir = function(bufnr, on_dir)
		local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
		root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
			or vim.list_extend(root_markers, { ".git" })
		local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
		local deno_lock_root = vim.fs.root(bufnr, { "deno.lock" })
		local project_root = vim.fs.root(bufnr, root_markers)
		if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
			return
		end
		if deno_root and (not project_root or #deno_root >= #project_root) then
			return
		end
		-- In a monorepo, prefer the nearest tsconfig over the monorepo root so
		-- vtsls picks up per-package compiler options (e.g. jsx) instead of
		-- falling back to implicit-project mode.
		local tsconfig_root = vim.fs.root(bufnr, { "tsconfig.json", "tsconfig.base.json" })
		if tsconfig_root and project_root and #tsconfig_root > #project_root then
			on_dir(tsconfig_root)
			return
		end
		on_dir(project_root or vim.fn.getcwd())
	end,
}
