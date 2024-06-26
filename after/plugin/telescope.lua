require('telescope').setup{
    defaults = {
        path_display={"truncate"}
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    pickers = {
        --lsp_references = {
            --theme = "dropdown"
        --},
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true
        },
        find_files = {
            find_command = {
                'fd',
                '--type',
                'f',
                '--color=never',
                '--hidden',
                '--follow'
            },
            --theme = "dropdown",
        }
    }
}

require('telescope').load_extension('fzf')

--map('n', '<leader>g', telescope.git_files)
--map('n', '<leader><leader>', telescope.buffers)
--map('n', '<leader>fh', telescope.help_tags)
--#map('n', '<Tab>', telescope.buffers)
