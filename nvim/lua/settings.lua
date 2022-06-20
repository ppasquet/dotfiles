local theme = require "theme"

local options = {
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
    foldmethod = "syntax"
}

for key, value in pairs(options) do 
    vim.opt[key] = value
end

