require 'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "python", "html", "julia", "json", "ruby", "ocaml"},
    sync_install = false,
    highlight = {
        enable = true,
        disable = {""},
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true,
        disable = { "yaml" }
    }
}

