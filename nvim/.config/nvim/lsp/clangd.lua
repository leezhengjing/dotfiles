return {
	cmd = {
		"clangd",
		-- "--query-driver=/opt/homebrew/bin/g++-15",
		-- "--query-driver=/usr/bin/clang++,/opt/homebrew/bin/g++-15",
		"--query-driver=/opt/homebrew/bin/g++*",
		"--clang-tidy",
		"--background-index",
		"--offset-encoding=utf-8",
		"--compile-commands-dir=.",
		"--header-insertion=iwyu",
	},
	-- init_options = {
	-- 	inlayHints = {
	-- 		enabled = false,
	-- 	},
	-- },
	root_markers = { ".clangd", "compile_commands.json", ".git", ".clang_format" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
}
