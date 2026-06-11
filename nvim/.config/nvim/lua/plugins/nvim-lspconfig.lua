return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			clangd = {
				init_options = {
					fallbackFlags = {
						"-std=c++20",
						"-stdlib=libstdc++",
						"-isystem",
						"/opt/homebrew/Cellar/gcc/15.2.0/include/c++/15.2.0",
						"-isystem",
						"/opt/homebrew/Cellar/gcc/15.2.0/include/c++/15.2.0/aarch64-apple-darwin",
					},
				},
			},
		},
	},
}
