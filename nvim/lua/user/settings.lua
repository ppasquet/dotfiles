local options = {
    clipboard = "unnamedplus",
    tabstop = 4,
    softtabstop = 0,
    expandtab = true,
    shiftwidth = 4,
    smarttab = true,
    number = true,
    hlsearch = true,
    ignorecase = true,
    showmatch = true,
    cc = "90",
    swapfile = false,
    backup = false,
    writebackup = false,
    foldmethod = "syntax",
    cmdheight = 2,
    updatetime = 300,
    fileencoding = "utf-8",
    wrap = false,
    scrolloff = 8
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

