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
