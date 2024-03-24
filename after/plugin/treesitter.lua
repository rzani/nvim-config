-- Syntax Highlight
require('nvim-treesitter.configs').setup{
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "php", "java", "python", "go", "javascript" },

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
