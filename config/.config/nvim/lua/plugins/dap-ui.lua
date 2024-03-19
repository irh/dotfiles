return {
  'rcarriga/nvim-dap-ui',
  event = 'VeryLazy',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup {
      mappings = {
        -- Use mouse clicks to open elements rather than expanding them
        expand = "<CR>",
        open = { "o", "<2-LeftMouse>" },
      },
    }

    -- Auto-open the UI when launching a debugger
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
  end
}
