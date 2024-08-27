return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' } }
	}
    use { "ellisonleao/gruvbox.nvim" }
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "L3MON4D3/LuaSnip" }
    use { "tpope/vim-surround" }
    use { 
        "numToStr/Comment.nvim", 
        config = function()
            require('Comment').setup()
        end
    }
    use { "tpope/vim-obsession" }
    -- Git
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-rhubarb" }
    use { "lewis6991/gitsigns.nvim" }
    -- -- DAP
    -- use { 'mfussenegger/nvim-dap' }
    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- use { "theHamsta/nvim-dap-virtual-text" }
end)

