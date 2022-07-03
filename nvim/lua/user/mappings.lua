local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local set = vim.opt

keymap('i', 'jk', '<ESC>', opts)

keymap('n', '<up>', '<nop>', {})
keymap('n', '<down>', '<nop>', {})
keymap('n', '<left>', '<nop>', {})
keymap('n', '<right>', '<nop>', {})

keymap('n', '<C-j>', '<C-w><C-j>', opts)
keymap('n', '<C-k>', '<C-w><C-k>', opts)
keymap('n', '<C-l>', '<C-w><C-l>', opts)
keymap('n', '<C-h>', '<C-w><C-h>', opts)
