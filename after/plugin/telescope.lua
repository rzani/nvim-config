local telescope = require('telescope.builtin')
local wk = require("which-key")

require('telescope').setup{
	defaults = {
		path_display={"smart"}
	},
    --pickers = {
        --find_files = {
            --theme = "dropdown",
        --}
    --},
    extensions = {}
}

--map('n', '<leader>g', telescope.git_files)
--map('n', '<leader><leader>', telescope.buffers)
--map('n', '<leader>fh', telescope.help_tags)
--#map('n', '<Tab>', telescope.buffers)

wk.register({
    ["<Tab>"] = { telescope.buffers, "buffers" },
    ["<C-p>"] = { telescope.git_files, "git files" }
})

wk.register({
  p = {
    name = " Project", -- optional group name
    f = { telescope.find_files, "find files" },
    s = { function() telescope.grep_string({ search = vim.fn.input("Grep > ")}) end, "search in files" },
  },
}, { 
    prefix = "<leader>",
    mode = "n"
})
