require("config.settings")
require("config.remap")
require("config.lazy")
require("config.lsp")

-- LazyVim's defaults set wrap = false, so override after it loads
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true

