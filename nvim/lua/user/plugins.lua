local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer..."
    print "Close & reopen neovim"
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save this file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install the plugins
return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" }

    -- Colorscheme
    use { "ellisonleao/gruvbox.nvim" }

    use { 'tpope/vim-surround' }
    use { 'tpope/vim-commentary' }
    use { 'vim-scripts/ReplaceWithRegister' }
    use { 'christoomey/vim-sort-motion' }
    use { 'christoomey/vim-system-copy' }
    use { 'airblade/vim-gitgutter' }
    use { 'kana/vim-textobj-user' }
    use { 'kana/vim-textobj-indent' }
    use { 'kana/vim-textobj-line' }
    use { 'kana/vim-textobj-entire' }
    use { 'jeffkreeftmeijer/vim-numbertoggle' }

    -- cmp plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Toggleterm
    use "akinsho/toggleterm.nvim"

    -- LazyGIT
    use "kdheepak/lazygit.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
