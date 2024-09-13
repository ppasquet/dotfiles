require "lspconfig".pyright.setup{
    cmd = {
        "/Users/pierrepasquet/.venv/bin/pyright-langserver", "--stdio"
    }, 
    settings = {
        pyright = {
            disableOrganizeInports = true,
        },
        python = {
            analysis = {
                ignore = { "*" }
            }
        }
    },
    filetypes = { "python" },
}

require "lspconfig".ruff.setup{
    cmd = { "ruff", "server" }, 
    filetypes = { "python" },
}

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

-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = 'LSP actions',
--   callback = function(event)
--     local opts = {buffer = event.buf}
--
--     vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
--     -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--     -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--     -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--     vim.keymap.set('n', "<leader>vrn", '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--     -- vim.keymap.set({'n', 'x'}, "<leader>f", '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--     vim.keymap.set('n', "<leader>vca", '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
--
--     vim.keymap.set('n', "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
--     -- vim.keymap.set('n', "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
--     -- vim.keymap.set('n', "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts) 
--   end
-- })


-- local cmp = require('cmp')
--
-- cmp.setup({
--   sources = {
--     {name = "nvim_lsp"},
--   },
--   mapping = cmp.mapping.preset.insert({
--     -- Enter key confirms completion item
--     ["<CR>"] = cmp.mapping.confirm({select = false}),
-- 	["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
-- 	['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
--     -- Ctrl + space triggers completion menu
--     ["<C-Space>"] = cmp.mapping.complete(),kk
--   }),
--   snippet = {
--     expand = function(args)
--       require("luasnip").lsp_expand(args.body)
--     end,
--   },
-- })
