-- o.cursorlineopt ='both' -- to enable cursorline!
--
-- A special interface |vim.opt| exists for conveniently interacting with list-
-- and map-style option from Lua: It allows accessing them as Lua tables and
-- offers object-oriented method for adding and removing entries.
local opt = vim.opt

-- Get or set options, like :set
local o = vim.o

-- Global Scope
local g = vim.g

-------------------------------------   options ----------------------------------
g.mapleader = " "

o.cursorline = true
o.cursorlineopt = "number"

-- Default encoding
g.encoding = "UTF-8"

-- show numbers
opt.number = true
opt.relativenumber = true
o.ruler = false

-- show matching parenthesis
o.showmatch = true

-- ignore case in vim commands
o.ignorecase = true

-- indenting
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- I trust you to be smarter and indent nicely :D
opt.smartindent = true

-- Mouse, why not?
o.mouse = "a"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- no wrap line
opt.wrap = true

-- set termguicolors to enable highlight groups
opt.termguicolors = true

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Backup files
opt.swapfile = false
opt.backup = false
o.undofile = true
g.undodir = "/tmp"

-- search highlight
opt.hlsearch = true
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- fast updatetime
opt.updatetime = 150

-- opt.colorcolumn = "80"
opt.foldcolumn = "1"
o.foldlevel = 20
o.foldlevelstart = 99
opt.foldenable = true

opt.clipboard = "unnamedplus"

o.showmode = false

-- disable somw default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
