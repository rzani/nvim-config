local wk = require("which-key")

wk.setup()

wk.register({
    --["<leader>r"] = { ":%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "sed word" },
    ["<leader>s"] = { function() vim.cmd("so") end, "source file" }
})

wk.register({
    name = " Workspace", -- optional group name
    r = {
        name = " Replace",
        --b = { vim.lsp.buf.rename, "Rename buffer" },
        r = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace current word" },
        e = { ':%s/.$//g<Cr>', "Remove last caracter" },
        q = { '<C-v>GI"<Esc>$<C-v>GA"<Esc>', "Wrap lines in quotes" },
        [","] = { '$<C-v>GA,<Esc>', "Comma at the end of lines" }
    }
}, {
    prefix = "<leader>",
})
