return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' } }
	}
    use { "ellisonleao/gruvbox.nvim" }
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use { 
        "williamboman/mason.nvim",
        requires = {{
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
        }}
    }
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
    use ({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })
    -- Git
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-rhubarb" }
    use { "lewis6991/gitsigns.nvim" }
    -- DAP
    use { 
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F12>", dap.restart)
        end
    } 
    use { "nvim-neotest/nvim-nio" }
    use { "rcarriga/nvim-dap-ui" }
    -- use { 
    --     "rcarriga/nvim-dap-ui",
    --     config = function()
    --         -- require("dapui").setup()
    --         -- local dap, dapui = require("dap"), require("dapui")
    --         -- vim.keymap.set("n", "<leader>?", function()
    --         --     require("dapui").eval(nil, { enter = true })
    --         -- end)
    --         -- dap.listeners.before.attach.dapui_config = function()
    --         --     dapui.open()
    --         -- end
    --         -- dap.listeners.before.launch.dapui_config = function()
    --         --     dapui.open()
    --         -- end
    --         -- dap.listeners.before.event_terminated.dapui_config = function()
    --         --     dapui.close()
    --         -- end
    --         -- dap.listeners.before.event_exited.dapui_config = function()
    --         --     dapui.close()
    --         -- end
    --     end
    -- }
    use { "theHamsta/nvim-dap-virtual-text" }
    -- use { 
    --     "rcarriga/nvim-dap-ui",
    --     requires = {{
    --         "theHamsta/nvim-dap-virtual-text",
    --     }},
    --     config = function()
    --         local dap = require "dap"
    --         local ui = require "dapui"
    --
    --         require("dapui").setup()
    --         require("dap-python").setup("/Users/pierrepasquet/Developer/debugpy/.venv/bin/python")
    --         require("dap-go").setup()
    --
    --         vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    --         -- vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
    --
    --         vim.keymap.set("n", "<leader>?", function()
    --             require("dapui").eval(nil, { enter = true })
    --         end)
    --
    --         vim.keymap.set("n", "<F1>", dap.continue)
    --         vim.keymap.set("n", "<F2>", dap.step_into)
    --         vim.keymap.set("n", "<F3>", dap.step_over)
    --         vim.keymap.set("n", "<F4>", dap.step_out)
    --         vim.keymap.set("n", "<F5>", dap.step_back)
    --         vim.keymap.set("n", "<F12>", dap.restart)
    --
    --         dap.listeners.before.attach.dapui_config = function()
    --             ui.open()
    --         end
    --         dap.listeners.before.launch.dapui_config = function()
    --             ui.open()
    --         end
    --         dap.listeners.before.event_terminated.dapui_config = function()
    --             ui.close()
    --         end
    --         dap.listeners.before.event_exited.dapui_config = function()
    --             ui.close()
    --         end
    --     end,
    -- }
end)

