local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}

keymap('i', 'jk', '<ESC>', opts)

vim.bo.expandtab = true
vim.bo.textwidth=120
vim.bo.tabstop=4
vim.bo.softtabstop=4
vim.bo.shiftwidth=4
vim.bo.autoindent = true
vim.wo.number = true        -- Show line numbers
vim.g.hlsearch = true       -- Highlights all results
vim.g.ignorecase = true     -- Ignore case in search
vim.g.incsearch = true      -- Show search results as you type
vim.g.showmatch = true      -- Show matching brackets
vim.wo.cc = "90"            -- Set a 90 column border
vim.bo.swapfile = false
vim.wo.foldmethod = "syntax"

-- Disable arrow keys in NORMAL and INSERT modes
keymap('i', '<up>', '<nop>', {})
keymap('i', '<down>', '<nop>', {})
keymap('i', '<left>', '<nop>', {})
keymap('i', '<right>', '<nop>', {})

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
        use 'neovim/nvim-lspconfig'
        use 'williamboman/nvim-lsp-installer'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'JuliaEditorSupport/julia-vim'
        use 'tmhedberg/SimpylFold'
    end
)

-- Gruvbox theme
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Treesitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "html", "python", "julia", "json"},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local options = {}
    if server.name == "sumneko_lua" then
        options = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim', 'use'}
                    }
                }
            }
        }
    end
    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(options)
end)

keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
keymap('n', 'gr', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
keymap('n', 'gt', ':lua vim.lsp.buf.references()<cr>', opts)
keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)

local cmp = require 'cmp'
cmp.setup({
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lsp_servers = {'sumneko_lua', 'pyright', 'julials'}
for _, lsp_server in pairs(lsp_servers) do
    require('lspconfig')[lsp_server].setup {
        capabilities = capabilities
    }
end

