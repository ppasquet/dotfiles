local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig.util")

require "lspconfig".pyright.setup {
    capabilities = capabilities,
    cmd = {
        "/Users/pierrepasquet/.venv/bin/pyright-langserver", "--stdio"
    }, 
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { "*" }
            }
        }
    },
    filetypes = { "python" },
}

require "lspconfig".ruff.setup {
    capabilities = capabilities,
    cmd = { "ruff", "server"},
    root_dir = util.find_git_ancestor(),
    filetypes = { "python" },
}

require "lspconfig".ts_ls.setup {}

require "lspconfig".zls.setup {}

require "lspconfig".rust_analyzer.setup {}


vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end
        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set('n', "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set('n', "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', "<leader>f", vim.lsp.buf.format, opts)
    end
})

