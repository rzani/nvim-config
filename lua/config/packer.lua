vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)

    use 'wbthomason/packer.nvim'

    --==  Extension  ==--

    use({ 
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Treesitter (Syntax highlight)
    -- Rodar: TSInstall <Language>
    -- Check installes LS: TSInstallInfo
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

    -- List of all edition changes
    use { 'mbbill/undotree' }

    -- for live_grep in telescope
    --use 'BurntSushi/ripgrep'

    -- improve find_files in telescope
    --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- File explorer
    --use {
        --'nvim-tree/nvim-tree.lua',
        --requires = {
            -- install  git clone https://github.com/ryanoasis/nerd-fonts.git
            --'nvim-tree/nvim-web-devicons', -- optional, for file icons
        --},
        --tag = 'nightly' -- optional, updated every week. (see issue #1193)
    --}

    --Startup page
    --use {
        --'goolord/alpha-nvim',
    --}

    -- Show keymaps
    use  'folke/which-key.nvim'

    -- Icons
    use { 'nvim-tree/nvim-web-devicons' }

    -- Git diff signs
    use  { 'lewis6991/gitsigns.nvim' }

    -- Status Line
    -- depends on gitsigns and nvim-web-devicons
    use { 'freddiehaddad/feline.nvim' }

    use {
        "NeogitOrg/neogit",
        requires = {
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        }
    }

    -- Floating Terminal
    --use 'numToStr/FTerm.nvim'

    -- Easy Motion
    --use 'phaazon/hop.nvim'

    -- Smooth Scrolling
    --use 'karb94/neoscroll.nvim'

    -- Auto Pairs
    --use 'windwp/nvim-autopairs'

    --use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        --require("toggleterm").setup()
    --end}

    -- Language Serves

    -- OmniSharp/omnisharp-vim
    --use 'OmniSharp/omnisharp-vim'
    use 'williamboman/mason.nvim'

    -- Language Server 
    --use 'neovim/nvim-lspconfig'

    -- Java
    -- brew install jdtls
    --use 'mfussenegger/nvim-jdtls'

    -- Auto Complete
    --use 'hrsh7th/cmp-nvim-lsp'
    --use 'hrsh7th/nvim-cmp'
    --use 'hrsh7th/cmp-buffer'

    -- Icons
    --use 'onsails/lspkind.nvim'

    -- Snippets
    --use 'L3MON4D3/LuaSnip'

    if packer_bootstrap then
        require('packer').sync()
    else
        require('config.plugins')
        require('config.remap')
    end
end,

config = {
    display = {
        open_fn = require('packer.util').float,
    }
}})
