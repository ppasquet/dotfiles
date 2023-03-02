local options = {
	guicursor = "",
	nu = true,
	relativenumber = true,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,
	wrap = false,
	swapfile = false,
	backup = false,
	hlsearch = false,
	incsearch = true,
	termguicolors = true,
	scrolloff = 8,
	signcolumn = "yes",
    updatetime = 50,
    colorcolumn = "80",
    splitbelow = true,
    splitright = true
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

