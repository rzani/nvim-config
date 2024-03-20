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
        r = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace current word" },
        e = { ':%s/.$//g<Cr>', "Remove last caracter" },
        q = { 'gg0<C-v>GI"<Esc>$<C-v>GA"<Esc>', "Wrap lines in quotes" },
        [","] = { 'gg$<C-v>GA,<Esc>', "Comma at the end of all lines" },
        [";"] = { 'gg$<C-v>GA;<Esc>', "Semicolon at the end of all lines" }
    },
    [","] = { 'A,<Esc>', "Comma at the of current line" },
    [";"] = { 'A;<Esc>', "Semicolon at the of current line" },
    ["="] = { 'gg<C-v>G=', "Format whole buffer"},
    ["?"] = { ':Cheatsheet<Cr>', "Cheatsheet"}
}, {
    prefix = "<leader>",
})

-- Surround word: ciw*<C-r>"*
