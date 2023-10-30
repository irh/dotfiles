local M = {}

M.setup = function()
  local dap = require('dap')

  local dap_breakpoint = {
    error = {
      text = "🔴",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "⭕️",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "➡",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

M.setup_ui = function()
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

return M
