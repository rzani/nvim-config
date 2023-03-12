-- show numbers
vim.wo.number = true

-- show relative numbers
vim.wo.relativenumber = true

-- show matching parenthesis
vim.o.showmatch = true

-- ignore case in vim commands
vim.o.ignorecase = true

-- transform tabs into spaces
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.encoding='UTF-8'

vim.o.nobackup = true
vim.o.noswapfile = true
vim.o.undofile = true
vim.g.undodir = '/tmp'
