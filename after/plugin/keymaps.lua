local wk = require("which-key")
local telescope = require('telescope.builtin')
local gs = require('gitsigns')
local neogit = require('neogit')

wk.setup()

-- Root maps
wk.register({
    ["<Tab>"] = { telescope.buffers, "buffers" },
    ["<C-p>"] = { telescope.find_files, "find files" },
    ["-"] = { ':Triptych <CR>', 'file explorer' }
})

-- Leader maps
wk.register({
    name = " workspace", -- optional group name
    g = {
        name = " git",   -- optional group name
        b = { function() gs.blame_line { full = true } end, "blame current line" },
        B = { gs.toggle_current_line_blame, "toggle current line blame" },
        f = { telescope.find_files, "find files" },
        g = { neogit.open, "status page" },
        s = { gs.stage_buffer, "stage current buffer" },
        S = { gs.undo_stage_hunk, "undo stage hunk" }
    },
    p = {
        name = " project", -- optional group name
        s = { function() telescope.grep_string({ search = vim.fn.input("Grep > ") }) end, "search in files" },
        e = { ':NvimTreeToggle<Cr>', "file explorer" },
    },
    r = {
        name = " replace",
        r = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "replace current word" },
    },
    f = {
        name = " file",
        a = { "gg0<C-v>GI'<Esc>$<C-v>GA'<Esc>gg$<C-v>GA,<Esc>G$xgg\"*yG", "wrap lines in apostrophes" },
        f = { function() vim.lsp.buf.format { async = true } end, "lsp format" },
        j = { ':%!jq --tab .<CR>', "jq format" },
        e = { ':%s/.$//g<Cr>', "remove last caracter" },
        ['"'] = { 'gg0<C-v>GI"<Esc>$<C-v>GA"<Esc>', "wrap lines in quotes" },
        ["'"] = { "gg0<C-v>GI'<Esc>$<C-v>GA'<Esc>", "wrap lines in apostrophes" },
        ["="] = { 'mzgg=G`z', "format whole buffer" },
        [","] = { 'gg$<C-v>GA,<Esc>', "comma at the end of all lines" },
        [";"] = { 'gg$<C-v>GA;<Esc>', "semicolon at the end of all lines" }
    },
    ["u"] = { vim.cmd.UndotreeToggle, "undo tree" },
    ["s"] = { function() vim.cmd("so") end, "source file" },
    [","] = { 'A,<Esc>', "comma at the of current line" },
    [";"] = { 'A;<Esc>', "semicolon at the of current line" },
    ["<space>"] = { ':HopPattern <CR>', "hop jump" },
    ["?"] = { ':Cheatsheet<Cr>', "cheatsheet" }
}, {
    prefix = "<leader>",
})

-- Surround word: ciw*<C-r>"*
