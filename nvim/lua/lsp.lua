-- local on_windows = vim.loop.os_uname().version:match 'Windows'
-- local function join_paths(...)
--     local path_sep = on_windows and '\\' or '/'
--     local result = table.concat({ ... }, path_sep)
--     return result
-- end

-- vim.cmd [[set runtimepath=$VIMRUNTIME]]

-- local temp_dir = vim.loop.os_getenv 'TEMP' or '/tmp'

-- vim.cmd('set packpath=' .. join_paths(temp_dir, 'nvim', 'site'))

-- local package_root = join_paths(temp_dir, 'nvim', 'site', 'pack')
-- local install_path = join_paths(package_root, 'packer', 'start', 'packer.nvim')
-- local compile_path = join_paths(install_path, 'plugin', 'packer_compiled.lua')

-- local function load_plugins()
--     require('packer').startup {
--         {
--             'wbthomason/packer.nvim',
--             'neovim/nvim-lspconfig',
--         },
--         config = {
--             package_root = package_root,
--             compile_path = compile_path,
--         },
--     }
-- end

_G.load_config = function()
    vim.lsp.set_log_level 'trace'
    if vim.fn.has 'nvim-0.5.1' == 1 then
        require('vim.lsp.log').set_format_func(vim.inspect)
    end
    local nvim_lsp = require('lspconfig')
    local on_attach = function(_, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap = true, silent = true }
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    end

    -- Servers
    local lsp_server_config = {
        ["sumneko_lua"] = {
            -- cmd
            {"lua-language-server"},
            -- settings
            {
                Lua = {
                    diagnostics = {
                        globals = {'vim', 'use'}
                    },
                    telemetry = {
                        enabled = false
                    }
                }
            }
        }
    }

    for lsp_server, config in pairs(lsp_server_config) do
        if not nvim_lsp[lsp_server].document_config.default_config.cmd and not config["cmd"] then
            print [[You have not defined a server default cmd for a server
              that requires it please edit lsp.lua]]
        end
        nvim_lsp[lsp_server].setup {
            cmd = config["cmd"],
            settings = config["settings"],
            on_attach = on_attach
        }
    end

    print [[You can find your log at $HOME/.cache/nvim/lsp.log. Please paste in a github issue under a details tag as described in the issue template.]]
end

if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
    load_plugins()
    require('packer').sync()
    vim.cmd [[autocmd User PackerComplete ++once lua load_config()]]
else
    load_plugins()
    require('packer').sync()
    _G.load_config()
end
