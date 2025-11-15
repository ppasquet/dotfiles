return {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
    filetypes = { "c", "h"},
    init_options = {
<<<<<<< Updated upstream
        fallbackFlags = { '-std=c2x', '-Wall' },
=======
        fallbackFlags = { '-std=c2x' },
>>>>>>> Stashed changes
    },
}
