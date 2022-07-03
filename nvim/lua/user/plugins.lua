local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = false,
}

return packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-commentary' }
    use { 'vim-scripts/ReplaceWithRegister' }
    use { 'christoomey/vim-sort-motion' }
    use { 'christoomey/vim-system-copy' }
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'airblade/vim-gitgutter' }
    use { 'kana/vim-textobj-user' }
    use { 'kana/vim-textobj-indent' }
    use { 'kana/vim-textobj-line' }
    use { 'kana/vim-textobj-entire' }
    use { 'jeffkreeftmeijer/vim-numbertoggle' }

    use { 'nvim-treesitter/nvim-treesitter' }
    
    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer' }

    use { 'tmhedberg/SimpylFold' } 

    -- cmp
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', requires = {"hrsh7th/nvim-cmp"}}
    use { 'hrsh7th/cmp-path', requires = {"hrsh7th/nvim-cmp"}}
    use { 'hrsh7th/cmp-cmdline', requires = {"hrsh7th/nvim-cmp"}}
    use { 'hrsh7th/cmp-nvim-lsp', requires = {"hrsh7th/nvim-cmp"}}
    use { 'saadparwaiz1/cmp_luasnip' }

    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }

    use { 'windwp/nvim-autopairs' }

    if packer_bootstrap then 
        require('packer').sync()
    end
end)
