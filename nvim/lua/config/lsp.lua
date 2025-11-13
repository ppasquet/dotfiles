vim.lsp.enable('ruff')
vim.lsp.enable('ty')
vim.lsp.enable('clangd')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set('n', "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set('n', "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', "<leader>f", vim.lsp.buf.format, opts)
    -- vim.keymap.set('n', "<leader>gd", lsp_definition_vsplit, opts)
  end,
})

-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true
  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
