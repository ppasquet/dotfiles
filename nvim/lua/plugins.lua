return {
    { 
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    { 
        "nvim-telescope/telescope-fzf-native.nvim", 
        build = "make" 
    },
    { 
        "ellisonleao/gruvbox.nvim", 
        priority = 1000, config = true 
    },
    { 
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate" 
    },
    { 
        "neovim/nvim-lspconfig",
    },
    -- {
    --     "hrsh7th/cmp-nvim-lsp"
    -- },
    -- {
    --     "hrsh7th/nvim-cmp"
    -- }
    -- { "hrsh7th/cmp-nvim-lsp" },
    { "tpope/vim-surround" },
    { "tpope/vim-obsession" },
    { "tpope/vim-fugitive" },
    { "numToStr/Comment.nvim" },
    { "lewis6991/gitsigns.nvim" },
}
