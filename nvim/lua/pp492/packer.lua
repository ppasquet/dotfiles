return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use { "ellisonleao/gruvbox.nvim" }
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "L3MON4D3/LuaSnip" }
    use {
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        -- config = function()
            -- require("obsidian").setup({
            --     workspaces = {
            --         {
            --             name = "pp492",
            --             path = "~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/pp492"
            --         },
            --     },
            --     daily_notes = {
            --         -- Optional, if you keep daily notes in a separate directory.
            --         folder = "daily",
            --         -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            --         template = nil
            --     },
            --     follow_url_func = function(url)
            --         -- Open the URL in the default web browser.
            --         vim.fn.jobstart({"open", url})  -- Mac OS
            --         -- vim.fn.jobstart({"xdg-open", url})  -- linux
            --     end,
            --     open_notes_in = "vsplit",
            -- })
        -- end,
    }
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
    use { "lewis6991/gitsigns.nvim" }
    use { "lervag/vimtex" }
    -- -- DAP
    -- use { 'mfussenegger/nvim-dap' }
    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- use { "theHamsta/nvim-dap-virtual-text" }
end)

