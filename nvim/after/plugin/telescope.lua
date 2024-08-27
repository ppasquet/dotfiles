require('telescope').setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    },
})
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>gd', foo, {})
-- vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions(), {})
vim.keymap.set('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' })<cr>", {})
vim.keymap.set('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references({ fname_width = 50 })<cr>", {})
