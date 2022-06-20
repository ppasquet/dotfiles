--[[local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent=true}
local set = vim.opt

keymap('i', 'jk', '<ESC>', opts)

keymap('n', '<up>', '<nop>', {})
keymap('n', '<down>', '<nop>', {})
keymap('n', '<left>', '<nop>', {})
keymap('n', '<right>', '<nop>', {})

-- Ease split navigations
keymap('n', '<C-j>', '<C-w><C-j>', opts)
keymap('n', '<C-k>', '<C-w><C-k>', opts)
keymap('n', '<C-l>', '<C-w><C-l>', opts)
keymap('n', '<C-h>', '<C-w><C-h>', opts)

-- Packages
require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'tpope/vim-surround'
        use 'tpope/vim-commentary'
        use 'vim-scripts/ReplaceWithRegister'
        use 'christoomey/vim-sort-motion'
        use 'christoomey/vim-system-copy'
        use 'ellisonleao/gruvbox.nvim'
        use 'airblade/vim-gitgutter'
        use 'kana/vim-textobj-user'
        use 'kana/vim-textobj-indent'
        use 'kana/vim-textobj-line'
        use 'kana/vim-textobj-entire'
        use 'jeffkreeftmeijer/vim-numbertoggle'
        use 'nvim-treesitter/nvim-treesitter'
        use 'williamboman/nvim-lsp-installer'
        -- use 'hrsh7th/cmp-nvim-lsp'
        -- use 'hrsh7th/cmp-buffer'
        -- use 'hrsh7th/cmp-path'
        -- use 'hrsh7th/cmp-cmdline'
        -- use 'hrsh7th/nvim-cmp'
        use 'JuliaEditorSupport/julia-vim'
        use 'tmhedberg/SimpylFold'
        -- use {
        --     'kyazdani42/nvim-tree.lua',
        --     requires = {
        --         'kyazdani42/nvim-web-devicons',
        --     },
        --     tag='nightly'
        -- }
    end
)


-- Treesitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "html", "python", "julia", "json", "ruby", "ocaml"},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

require('lsp')--]]

require "settings"
require "plugins"
require "mappings"
require "theme"
-- require "lsp"
