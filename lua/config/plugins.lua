-- Theme
--require('onedark').load()

-- Syntax Highlight
require('nvim-treesitter.configs').setup{
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "php", "java", "python", "go", "javascript" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
        --disable = { "bash" },
    },
}

-- ~/.local/share/nvim/mason
require('mason').setup()

-- Telescope (file search) 
require('telescope').setup{
    defaults = {
        path_display={"smart"},
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        }
    },
} 

-- empty setup using defaults
local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too
require("nvim-tree").setup{
    view = {
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = "rounded",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
    }
}

-- Show status line
require('feline').setup()
 
-- Show git status in Feline
require('gitsigns').setup()

-- Floating terminal
require('FTerm').setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

require('hop').setup()

require("which-key").setup()

require'alpha'.setup(require'alpha.themes.startify'.config)

require('neoscroll').setup()

require("nvim-autopairs").setup()
