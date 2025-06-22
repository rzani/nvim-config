local wk = require("which-key")

wk.add({
	{ "<leader>j", group = "java" },
	{ "<leader>jp", ":JavaProfile<cr>", desc = "Java Profile", buffer = bufnr },
	{ "<leader>jr", ":JavaRunnerRunMain<cr>", desc = "Java Run", buffer = bufnr },
	{ "<leader>js", ":JavaRunnerStopMain<cr>", desc = "Java Stop", buffer = bufnr },
	{
		"<leader>jo",
		function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" } },
				apply = true,
			})
		end,
		desc = "Organize imports",
		buffer = bufnr,
	},
	{
		"<leader>jg",
		function()
			vim.lsp.buf.code_action({
				context = { only = { "source.generate" } },
				apply = true,
			})
		end,
		desc = "Generate",
		buffer = bufnr,
	},
})
