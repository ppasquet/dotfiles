require("config.lazy")
require("config.remap")
require("config.set")

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})

vim.lsp.enable("rust_analyzer")
