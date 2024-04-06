vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        --==  Extension  ==--

        -- Theme
        use({
            'rose-pine/neovim',
            as = 'rose-pine',
            config = function()
                vim.cmd('colorscheme rose-pine')
            end
        })

        use({
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("catppuccin").setup()
            end
        })

        -- File Explorer
        use {
            'simonmclean/triptych.nvim',
            requires = {
                'nvim-lua/plenary.nvim',       -- required
                'nvim-tree/nvim-web-devicons', -- optional
            }
        }

        -- Navigation
        use { 'christoomey/vim-tmux-navigator' }

        -- Syntax highlight
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

        -- File search and dialog management
        -- brew install fd
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.4',
            requires = {
                'nvim-lua/plenary.nvim',
                'BurntSushi/ripgrep', -- live grep
            }
        }

        -- Easy Motion
        use 'smoka7/hop.nvim'

        -- List of all edition changes
        use { 'mbbill/undotree' }

        --Startup page
        use { 'goolord/alpha-nvim' }

        -- Show keymaps
        use { 'folke/which-key.nvim' }

        -- Icons
        use { 'nvim-tree/nvim-web-devicons' }

        -- Git diff signs
        use { 'lewis6991/gitsigns.nvim' }

        -- Status Line
        use { 'freddiehaddad/feline.nvim' }

        -- Git integration
        use {
            "NeogitOrg/neogit",
            requires = {
                "sindrets/diffview.nvim",        -- optional - Diff integration
                "nvim-telescope/telescope.nvim", -- optional
            }
        }

        -- Auto Pairs
        use 'windwp/nvim-autopairs'

        -- Cheatsheet
        use {
            'sudormrfbin/cheatsheet.nvim',

            requires = {
                { 'nvim-telescope/telescope.nvim' },
                { 'nvim-lua/popup.nvim' },
                { 'nvim-lua/plenary.nvim' },
            }
        }

        use({
            "kylechui/nvim-surround",
            tag = "*", -- Use for stability; omit to use `main` branch for the latest features
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end
        })

        use { 'nvim-tree/nvim-tree.lua' }

        use {
            "karb94/neoscroll.nvim",
            config = function()
                require('neoscroll').setup {}
            end
        }

        --
        --== LSP ==--
        --
        use { 'neovim/nvim-lspconfig' }

        use { 'williamboman/mason.nvim' }
        use { 'williamboman/mason-lspconfig.nvim' }

        -- Weirdo
        use { 'mfussenegger/nvim-jdtls' }

        -- Autocompletion plugin
        use 'hrsh7th/nvim-cmp'

        -- LSP source for nvim-cmp
        use 'hrsh7th/cmp-nvim-lsp'

        -- Snippets source for nvim-cmp
        use 'saadparwaiz1/cmp_luasnip'

        -- Snippets plugin
        use { 'L3MON4D3/LuaSnip',
            tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            run = "make install_jsregexp"
        }

        use {
            "aznhe21/actions-preview.nvim",
        }

        -- improve find_files in telescope
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        if packer_bootstrap then
            require('packer').sync()
        end
    end,

    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})

-- Floating Terminal
--map('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>')
--map('t', '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
