vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)

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

    -- File Explorer
    use {
        'simonmclean/triptych.nvim',
        requires = {
            'nvim-lua/plenary.nvim', -- required
            'nvim-tree/nvim-web-devicons', -- optional
        }
    }

    -- Syntax highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- File search and dialog management
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {{'nvim-lua/plenary.nvim'}}
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
    use  { 'lewis6991/gitsigns.nvim' }

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


    --
    --== LSP ==--
    --
    use { 'neovim/nvim-lspconfig' }

    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}

    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'

    -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippets source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'

    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'


    --use {
     --   "L3MON4D3/LuaSnip",
        -- follow latest release.
      --  tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
       -- run = "make install_jsregexp"
--    }

    -- for live_grep in telescope
    --use 'BurntSushi/ripgrep'

    -- improve find_files in telescope
    --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Java
    -- brew install jdtls
    --use 'mfussenegger/nvim-jdtls'

    if packer_bootstrap then
        require('packer').sync()
    end
end,

config = {
    display = {
        open_fn = require('packer.util').float,
    }
}})



-- Floating Terminal
--map('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>')
--map('t', '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')



--function P.map_java_keys(bufnr)
    --map_lsp_keys()
    --local spring_boot_run = 'mvn spring-boot:run'---Dspring-boot.run.profiles=local'
    --local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
    --map('n', '<leader>sr', command)
    --map('n', '<leader>oi', ':lua require("jdtls").organize_imports()<CR>')
    --map('n', '<leader>jc', ':lua require("jdtls).compile("incremental") ' )
--end


