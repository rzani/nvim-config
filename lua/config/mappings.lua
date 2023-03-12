local map = vim.keymap.set
local opts = {noremap = true}

vim.g.mapleader = ','

-- Telescope Plugin (Searching files)
local telescope = require('telescope.builtin')
map('n', '<C-p>', telescope.find_files)
map('n', '<leader>f', telescope.live_grep)
map('n', '<leader>g', telescope.git_files)
map('n', '<Tab>', telescope.buffers)
map('n', '<leader>fh', telescope.help_tags)

-- Closing Buffer
map('n', '<leader>q', ':bp <BAR> bd! #<CR>')

-- NvimTree
map('n', '-', ':NvimTreeToggle <CR>')

-- Moving lines arround in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Remove Hightligh from search
map("n", "<leader> ", ":nohlsearch<CR>")

-- Floating Terminal
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- GitSigns
local gs = require('gitsigns')
map('n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
end, {expr=true})

map('n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
end, {expr=true})

-- Actions
map('n', '<leader>hs', gs.stage_buffer)
map('n', '<leader>hS', gs.undo_stage_hunk)
map('n', '<leader>hR', gs.reset_buffer)
map('n', '<leader>hp', gs.preview_hunk)
map('n', '<leader>hb', function() gs.blame_line{full=true} end)
map('n', '<leader>tb', gs.toggle_current_line_blame)
map('n', '<leader>hd', gs.diffthis)
map('n', '<leader>hD', function() gs.diffthis('~') end)
map('n', '<leader>td', gs.toggle_deleted)

-- Text object
map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')


