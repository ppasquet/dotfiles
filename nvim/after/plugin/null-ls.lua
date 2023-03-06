local null_ls = require("null-ls")

-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
        -- formatting.ruff
    }
})

