local dap_ui = require("dapui")
dap_ui.setup()

vim.keymap.set("n", "1", ":lua require'dap'.step_over()<CR>");
vim.keymap.set("n", "2", ":lua require'dap'.step_into()<CR>");
vim.keymap.set("n", "3", ":lua require'dap'.step_out()<CR>");
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>");
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition > '))<CR>");
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

-- dap_python.setup("~/.pyenv/versions/debugpy/bin/python3")
--
local dap = require('dap')
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = '~/.pyenv/versions/debugpy/bin/python3',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end
