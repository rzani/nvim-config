require("config.lazy")
require("autocmd")
--require("config.lsp")

vim.schedule(function()
	require("mappings")
end)
