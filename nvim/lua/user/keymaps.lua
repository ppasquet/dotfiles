local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap('i', 'jk', '<ESC>', opts)

-- Spacebar as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('n', '<up>', '<nop>', {})
keymap('n', '<down>', '<nop>', {})
keymap('n', '<left>', '<nop>', {})
keymap('n', '<right>', '<nop>', {})

-- Better window navigation
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-h>', '<C-w>h', opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<leader><up>", ":resize +2<cr>", opts)
keymap("n", "<leader><down>", ":resize -2<cr>", opts)
keymap("n", "<leader><left>", ":vertical resize -2<cr>", opts)
keymap("n", "<leader><right>", ":vertical resize +2<cr>", opts)

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- TODO: Fix the mapping
-- keymap("v", "ª", ":m .+1<CR>==", opts)
-- keymap("v", "º", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP"', opts)
