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


-- Floating Terminal
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
