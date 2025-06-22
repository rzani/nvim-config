local M = {}

M.on_attach = function(_, bufnr)
	local wk = require("which-key")

	wk.add({
		{ "gD", vim.lsp.buf.declaration, desc = "LSP Go to declaration", mode = "n", buffer = bufnr },
		{ "gd", vim.lsp.buf.definition, desc = "LSP Go to definition", mode = "n", buffer = bufnr },
		{ "gi", vim.lsp.buf.implementation, desc = "LSP Go to implementation", mode = "n", buffer = bufnr },
		{ "gr", vim.lsp.buf.references, desc = "LSP Show references", mode = "n", buffer = bufnr },
		{ "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code action", mode = { "n", "v" }, buffer = bufnr },
		{ "<leader>cs", vim.lsp.buf.signature_help, desc = "LSP Signature help", mode = "n", buffer = bufnr },
		{ "<leader>cr", vim.lsp.buf.rename, desc = "LSP NvRenamer", buffer = bufnr },
		{ "<leader>cd", vim.diagnostic.open_float, desc = "LSP Diagnostic", buffer = bufnr },
	})

	wk.add({
		{ "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "LSP Add workspace folder", buffer = bufnr },
		{ "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "LSP Remove workspace folder", buffer = bufnr },
		{
			"<leader>wl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			desc = "LSP List workspace folders",
			buffer = bufnr,
		},
	})
end

M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.defaults = function()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")

	local servers = { "lua_ls", "html", "cssls", "pyright", "ts_ls", "groovyls" }

	mason_lspconfig.setup({
		ensure_installed = servers,
	})

	-- brew install lua-language-server
	lspconfig.lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		on_init = M.on_init,

		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
						"${3rd}/luv/library",
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	})

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = M.on_attach,
			on_init = M.on_init,
			capabilities = M.capabilities,
		})

		--vim.notify("LSP Carregado " .. lsp)
	end
end

return M
