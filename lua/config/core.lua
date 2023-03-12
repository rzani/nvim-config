vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost core.lua source <afile> | PackerCompile
augroup end
]])

require('config.options')

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)

    use 'wbthomason/packer.nvim'

    -------------- Plugins ----------------
    --
    -- Themes
    use 'navarasu/onedark.nvim'

    -- telescope (file search)
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
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

    if packer_bootstrap then
        require('packer').sync()
    else
        require('config.plugins')
        require('config.mappings')
    end
end,
config = {
    display = {
        open_fn = require('packer.util').float,
    }
}})
