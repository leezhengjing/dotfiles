return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objc", "objcpp" },
	root_markers = {
		".git",
		"compile_commands.json",
		".sourcekit-lsp",
		"Package.swift",
	},
	capabilities = {
		textDocument = {
			diagnostic = {
				dynamicRegistration = true,
				relatedDocumentSupport = true,
			},
		},
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
}
