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
    textwidth = 120,
    colorcolumn = "121",
    splitbelow = true,
    splitright = true,
    conceallevel = 1,
    autoread = true,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
