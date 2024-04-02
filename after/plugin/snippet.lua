local ls = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/my_snippets"})

vim.keymap.set({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
