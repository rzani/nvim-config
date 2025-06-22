--require "nvchad.mappings"
local wk = require("which-key")
local map = vim.keymap.set
-- Remaing the cursor when J
map("n", "J", "mzJ`z", { desc = "Flat lines" })

-- Centralize buffer while moving up an down the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- The MOST FANTASTIC keymap
map("x", "<leader>p", '"_dp')

-- Remove Hightligh from search
map("n", ",<Space>", ":nohlsearch<CR>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

-- CONTROL
--
-- Normal mode
wk.add({
	{
		"<leader><Tab>",
		function()
			require("telescope.builtin").buffers()
		end,
		desc = "List buffers",
	},

	-- height control
	{ "<M-->", "<C-w>-", desc = "Decrease Height" },
	{ "<M-=>", "<C-w>+", desc = "Increate Height" },

	{ "n", "nzzzv", desc = "Next ocurrence" },
	{ "N", "Nzzzv", desc = "Next ocurrence" },

	-- terminal
	-- {
	--   "<C-t>",
	--   function()
	--     require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
	--   end,
	--   desc = "Toggle floating Terminal",
	--   mode = {"n", "t"}
	-- },

	{ "<C-h>", "<C-w>h", desc = "Switch Window LEFT", mode = "n" },
	{ "<C-l>", "<C-w>l", desc = "Switch Window RIGHT", mode = "n" },
	{ "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree toggle window" },
	{ "<C-j>", "<C-w>j", desc = "Switch Window DOWN", mode = "n" },
	{ "<C-k>", "<C-w>k", desc = "Switch Window UP", mode = "n" },
	{ "<C-s>", "<cmd>w<CR>", desc = "General save file", mode = "n" },
	{ "<C-c>", "<cmd>%y+<CR>", desc = "General copy whole file", mode = "n" },
})

-- Insert mode
wk.add({
	{
		"<C-;>",
		"<Esc>mzA;<Esc>`z",
		desc = "Semicollon end of line",
		mode = { "i", "n" },
	},
	{
		"<C-,>",
		"<Esc>mzA,<Esc>`z",
		desc = "Comma end of line",
		mode = { "i", "n" },
	},

	{ "<C-a>", "<Esc>I", desc = "Go to End of Line", mode = "i" },
	{ "<C-b>", "<Left>", desc = "Move left", mode = "i" },
	{ "<C-e>", "<End>", desc = "Go to End of Line", mode = "i" },
	{ "<C-f>", "<Right>", desc = "move right", mode = "i" },
	{ "<C-h>", "<Left>", desc = "move left", mode = "i" },
	{ "<C-l>", "<Right>", desc = "move right", mode = "i" },
	{ "<C-j>", "<Down>", desc = "move down", mode = "i" },
	{ "<C-k>", "<Up>", desc = "move up", mode = "i" },
	-- { 'jj', '<esc>:w<cr>', desc = '<esc> and save with jj' },
	-- { 'kk', '<esc>:w<cr>', desc = '<esc> and save with kk' },
})
-- Visual mode
wk.add({
	{ "<C-j>", ":m '>+1<CR>gv=gv", desc = "Moves lines DOWN", mode = "v" },
	{ "<C-k>", ":m '<-2<CR>gv=gv", desc = "Moves lines UP", mode = "v" },
	{ "<", "<gv", desc = "Moves Lines LEFT", mode = "v" },
	{ ">", ">gv", desc = "Moves Lines RIGHT", mode = "v" },
})

--
-- LEADER
--
-- Special
wk.add({
	{ "<leader>/", "gcc", desc = "Toggle comment", remap = true, mode = "n" },
	{ "<leader>/", "gc", desc = "Toggle comment", remap = true, mode = "v" },
	{
		",.",
		"<C-^><CR>",
		desc = "Switch between buffers",
		remap = true,
		mode = "n",
	},
})
-- A
-- B
-- C
wk.add({
	{ "<leader>c", group = "code", icon = "" },
})
-- D
wk.add({
	{ "<leader>d", group = "dap", icon = "" },
})
-- E
-- F is for File
wk.add({
	{ "<leader>f", group = "file", mode = "n" },
	{
		"<leader>ff",
		"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
		desc = "Find All Files",
	},
	{
		"<leader>fb",
		"<cmd>Telescope current_buffer_fuzzy_find<CR>",
		desc = "Find in Current Buffer",
	},
	{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{
		"<leader>fm",
		function()
			require("conform").format({ lsp_fallback = true })
		end,
		desc = "Format",
	},
	{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find Oldfiles" },
	{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
})
-- G is for GIT
wk.add({
	{ "<leader>g", group = "git" },
	{
		"<leader>gs",
		function()
			local ok, neogit = pcall(require, "neogit")
			if ok then
				neogit.open()
			else
				vim.notify("Neogit não encontrado")
			end
		end,
		desc = "Status - Neogit",
	},
	{ "<leader>gS", "<cmd>Telescope git_status<CR>", desc = "Status - Telecope" },
	{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
	{ "<leader>gb", require("gitsigns").blame, desc = "Blame" },
	{
		"<leader>gB",
		function()
			require("gitsigns").toggle_current_line_blame({ full = true })
		end,
		desc = "Toggle current line blame",
	},
})

-- H
wk.add({
	{ "<leader>h", group = "harpoon", icon = "󰛢" },
})
-- { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Help Page" },

-- I
-- J
-- K
-- L
-- M
wk.add({
	{ "<leader>m", group = "marks", icon = "󰟙" },
	{ "<leader>mf", "<cmd>Telescope marks<CR>", desc = "Find marks" },
})
--
--
-- O

-- P
-- { "<leader>pt", "<cmd>Telescope terms<CR>",  desc = "Pick Hidden Term" },

-- Q
wk.add({
	{ "<leader>q", ":bp <BAR> bd! #<CR>", desc = "Close buffer", icon = "" },
	{ "<leader>Q", "<cmd>qa!<cr>", desc = "Close Vim", icon = "" },
})

-- R

-- S
wk.add({
	{ "<leader>s", group = "source", icon = "󰜘" },
	{ "<leader>sf", "<cmd>source %<CR>", desc = "Source Current File" },
})
-- T
-- U
-- V
-- W is fo Workspace
wk.add({
	{ "<leader>w", group = "workspace", icon = "󰠳" },
})
-- X
-- Y is fo Yank  -- Maybe 'll be removed
wk.add({
	{ "<leader>y", '"+y', desc = "Yank", mode = "n" },
	{ "<leader>y", '"+y', desc = "Yank", mode = "i" },
	{ "<leader>y", '"+y', desc = "Yank", mode = "v" },
})
-- Z

-- Toggle code folding
--map('n', '=', 'za')
