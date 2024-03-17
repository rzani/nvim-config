local wk = require("which-key")

wk.setup()

wk.register({
    --["<leader>r"] = { ":%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "sed word" },
    ["<leader>s"] = { function() vim.cmd("so") end, "source file" }
})
