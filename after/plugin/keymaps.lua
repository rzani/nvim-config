local wk = require("which-key")
local telescope = require('telescope.builtin')
local gs = require('gitsigns')
local neogit = require('neogit')

wk.setup()

-- Root maps
wk.register({
    ["<Tab>"] = { telescope.buffers, "buffers" },
    ["-"] = { ':Triptych <CR>', 'file explorer' },
})

-- Leader maps
wk.register({
    g = {
        name = "Git",   -- optional group name
        b = { function() gs.blame_line { full = true } end, "Blame current line" },
        B = { gs.toggle_current_line_blame, "Toggle current line blame" },
        g = { neogit.open, "Status page" },
        s = { gs.stage_buffer, "Stage current buffer" },
        S = { gs.undo_stage_hunk, "Undo stage hunk" }
    },
    j = { ':HopPattern <CR>', "hop jump" },
    p = {
        name = "Project", -- optional group name
        e = { ':NvimTreeToggle<Cr>', "File explorer" },
        g = { telescope.live_grep, "Live grep" },
        h = { telescope.help_tags, "Help tags"},
        p = { telescope.git_files, "Find files"},
        s = { function() telescope.grep_string({ search = vim.fn.input("Grep > ") }) end, "Search in files" },
    },
    r = {
        name = "Replace",
        r = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace current word" },
    },
    s = { ":w<CR>", "Save file" },
    f = {
        name = "File",
        a = { "gg0<C-v>GI'<Esc>$<C-v>GA'<Esc>gg$<C-v>GA,<Esc>G$xgg\"*yG", "Wrap lines in apostrophes" },
        f = { function() vim.lsp.buf.format { async = true } end, "lsp format" },
        j = { ':%!jq --tab .<CR>', "jq format" },
        e = { ':%s/.$//g<Cr>', "remove last caracter" },
        ['"'] = { 'gg0<C-v>GI"<Esc>$<C-v>GA"<Esc>', "wrap lines in quotes" },
        ["'"] = { "gg0<C-v>GI'<Esc>$<C-v>GA'<Esc>", "wrap lines in apostrophes" },
        ["="] = { 'mzgg=G`z', "format whole buffer" },
        [","] = { 'gg$<C-v>GA,<Esc>', "comma at the end of all lines" },
        [";"] = { 'gg$<C-v>GA;<Esc>', "semicolon at the end of all lines" }
    },
    ["c"] = { telescope.commands, 'commands' },
    ["u"] = { vim.cmd.UndotreeToggle, "undo tree" },
    --["s"] = { function() vim.cmd("so") end, "source file" },
    ["<space>"] = { telescope.find_files, "Find files" },
    [","] = { 'A,<Esc>', "comma at the of current line" },
    [";"] = { 'A;<Esc>', "semicolon at the of current line" },
    ["?"] = { ':Cheatsheet<Cr>', "cheatsheet" }
}, {
    prefix = "<leader>",
})

-- Surround word: ciw*<C-r>"*
