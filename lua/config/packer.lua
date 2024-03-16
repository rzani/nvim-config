vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)

    use 'wbthomason/packer.nvim'

    -------------- Plugins ----------------
    --
    -- Themes
    use 'navarasu/onedark.nvim'

    -- Treesitter (Syntax highlight)
    -- Rodar: TSInstall <Language>
    -- Check installes LS: TSInstallInfo
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- telescope (file search)
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- for live_grep in telescope
    use 'BurntSushi/ripgrep'

    -- improve find_files in telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            -- install  git clone https://github.com/ryanoasis/nerd-fonts.git
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    --Startup page
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Show keymaps
    use  'folke/which-key.nvim'

    -- Status Line
    use {
        'freddiehaddad/feline.nvim',
        requires = {'lewis6991/gitsigns.nvim'}
    }

    -- Floating Terminal
    use 'numToStr/FTerm.nvim'

    -- Easy Motion
    use 'phaazon/hop.nvim'

    -- Smooth Scrolling
    use 'karb94/neoscroll.nvim'

    -- Auto Pairs
    use 'windwp/nvim-autopairs'

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- Language Serves

    -- OmniSharp/omnisharp-vim
    --use 'OmniSharp/omnisharp-vim'
    use 'williamboman/mason.nvim'

    -- Language Server 
    use 'neovim/nvim-lspconfig'

    -- Java
    -- brew install jdtls
    use 'mfussenegger/nvim-jdtls'

    -- Auto Complete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'

    -- Icons
    use 'onsails/lspkind.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip'

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
