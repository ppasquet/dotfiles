-- vim.opt.termguicolors = true
-- vim.opt.background = "dark"
-- require("gruvbox").setup({
--     contrast="soft"
-- })
-- vim.cmd.colorscheme("gruvbox")
-- highlight Normal     ctermbg=NONE guibg=NONE
-- highlight LineNr     ctermbg=NONE guibg=NONE
-- highlight SignColumn ctermbg=NONE guibg=NONE
-- hi! Normal ctermbg=NONE guibg=NONE
-- hi! NonText ctermbg=NONE guibg=NONE
-- hi Normal ctermbg=none
-- vim.opt.termguicolors = true
-- autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
