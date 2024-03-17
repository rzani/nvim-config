local lspconfig = require('lspconfig')
local wk = require("which-key")
local map = vim.keymap.set
local servers = {
    'tsserver', 'jdtls', 'lua_ls', 'dockerls'
}

require('mason').setup()

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require('mason-lspconfig').setup({
    ensure_installed = servers,
})

-- Setup all languages servers
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities
    }
end

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lspconfig.tsserver.setup({})

--map('n', '<space>e', vim.diagnostic.open_float)
--map('n', '[d', vim.diagnostic.goto_prev)
--map('n', ']d', vim.diagnostic.goto_next)
--map('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {

    group = vim.api.nvim_create_augroup('UserLspConfig', {}),

    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        wk.register({
            ["D"] = { vim.lsp.buf.declaration, "Go to declaration" },
            ["d"] = { vim.lsp.buf.definition, "Go to definition" },
            ["i"] = { vim.lsp.buf.implementation, "Go to implementation" },
            ["r"] = { vim.lsp.buf.references, "Go to references" },
            ["t"] = { vim.lsp.buf.type_definition, "Go to type definition" }
        }, {
            prefix = "g",
            buffer = ev.buf,
            mode = "n"
        })

        wk.register({
            ["K"] = { vim.lsp.buf.hover, "Hover box description" }
        }, {
            buffer = ev.buf
        })

        wk.register({
            w = {
                name = " Workspace", -- optional group name
                a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
                r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
                l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" }
            }
        }, {
            prefix = "<leader>",
            buffer = ev.buf
        })

        --map("n", "<leader>r", )

        map('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        map('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
    end,
})
