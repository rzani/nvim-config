local telescope = require('telescope.builtin')
local map = vim.keymap.set

-- Telescope Plugin (Searching files)
-- ------------------------------------
map('n', '<C-p>', telescope.git_files)
map('n', '<leader>pf', telescope.find_files)
map('n', '<leader>ps', function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") });
end)
map('n', '<Tab>', telescope.buffers)

--map('n', '<leader>g', telescope.git_files)
--map('n', '<leader><leader>', telescope.buffers)
--map('n', '<leader>fh', telescope.help_tags)
--#map('n', '<Tab>', telescope.buffers)
