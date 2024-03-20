local telescope = require('telescope.builtin')

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

