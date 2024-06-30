require("lazy").setup({

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep", -- live grep
        }
    },

    -- File Explorer
    {
        "simonmclean/triptych.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        }
    },

    -- Tmux Navigation
    { "christoomey/vim-tmux-navigator" },

    -- Syntax highlight
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    -- Easy Motion
    { "smoka7/hop.nvim" },

    -- List of all edition changes
    { "mbbill/undotree" },

    --Startup page
    { "goolord/alpha-nvim" },

    -- Show keymaps
    { "folke/which-key.nvim" },

    -- Icons
    { "nvim-tree/nvim-web-devicons" },

    -- Git diff signs
    {
        "lewis6991/gitsigns.nvim"
    },

    -- Status Line
    { "freddiehaddad/feline.nvim" },

    -- Git integration
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        }
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Auto Pairs
    { "windwp/nvim-autopairs" },

    -- Cheatsheet
    {
        "sudormrfbin/cheatsheet.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        }
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    { "nvim-tree/nvim-tree.lua" },

    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup {}
        end
    },

    --
    --== LSP ==--
    --
    { "neovim/nvim-lspconfig" },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Weirdo
    { "mfussenegger/nvim-jdtls" },

    -- Autocompletion plugin
    { "hrsh7th/nvim-cmp" },

    -- LSP source for nvim-cmp
    { "hrsh7th/cmp-nvim-lsp" },

    -- Snippets source for nvim-cmp
    { "saadparwaiz1/cmp_luasnip" },

    -- Snippets plugin
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        build = "make install_jsregexp"
    },

    { "aznhe21/actions-preview.nvim" },

    -- improve find_files in telescope
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
})
