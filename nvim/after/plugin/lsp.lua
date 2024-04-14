local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set('n', "gd", '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', "<leader>vrn", '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, "<leader>f", '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', "<leader>vca", '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    vim.keymap.set('n', "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
    vim.keymap.set('n', "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts) 

    vim.keymap.set('n', "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
    vim.keymap.set('n', "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
    vim.keymap.set('n', "<leader>zt", "<Cmd>ZkTags<CR>", opts)
    vim.keymap.set('n', "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
  end
})

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        default_setup,
        lua_ls = function()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT"
                        },
                        diagnostics = {
                            globals = {"vim"},
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end,
    },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = "nvim_lsp"},
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ["<CR>"] = cmp.mapping.confirm({select = false}),
	["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
	['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    -- Ctrl + space triggers completion menu
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})
-- local lsp = require("lsp-zero")
--
-- lsp.preset("recommended")

-- Fix Undefined global 'vim'
-- lsp.configure('lua_ls', {
-- 	settings = {
-- 		Lua = {
--             runtime = {
--                 version = "LuaJIT",
--             },
-- 			diagnostics = {
-- 				globals = { 'vim' }
-- 			},
--             telemetry = {
--                 enable = false
--             }
-- 		}
-- 	}
-- })

-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
-- 	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
-- 	['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- 	["<C-Space>"] = cmp.mapping.complete(),
-- })
--
-- lsp.setup_nvim_cmp({
-- 	mapping = cmp_mappings
-- })

-- lsp.set_preferences({
-- 	suggest_lsp_servers = false,
-- 	sign_icons = {
-- 		error = 'E',
-- 		warn = 'W',
-- 		hint = 'H',
-- 		info = 'I'
-- 	}
-- })
--
-- lsp.on_attach(function(_, bufnr)
-- 	local opts = {buffer = bufnr, remap = false}
--
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	-- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	-- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	-- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	-- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
 --    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
	-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)
--
-- lsp.setup()
--
-- vim.diagnostic.config({
-- 	virtual_text = true,
-- })
--
