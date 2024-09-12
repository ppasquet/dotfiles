return {
    { 
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { 
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp"
        }
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "tpope/vim-surround" },
    { "tpope/vim-obsession" },
    { "tpope/vim-fugitive" },
    { "numToStr/Comment.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { 
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim"
        },
        config = function()
            local dap = require "dap"
            local ui = require "dapui"

            require("dapui").setup()
            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F13>", dap.restart)
        end
    }
}
