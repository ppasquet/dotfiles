require 'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "python", "html", "julia", "json", "ruby", "ocaml"},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

