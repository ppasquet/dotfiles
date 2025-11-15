return {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
    filetypes = { "c", "h"},
    init_options = {
        fallbackFlags = { '-std=c2x', '-Wall' },
    },
}
