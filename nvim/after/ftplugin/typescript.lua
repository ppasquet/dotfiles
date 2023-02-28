local options = {
    shiftwidth = 2,
    tabstop = 2,
    softtabstop = 2
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
