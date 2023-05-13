local spinner_frames = { '⣾', '⣷', '⣯', '⣟', '⡿', '⢿', '⣻', '⣽' }
local spinner_frame_count = vim.tbl_count(spinner_frames)
local spin_update_ms = 50

local M = {}

M.spin_frame = 0
M.last_spin_update = vim.loop.now()

local get_diagnostic = function(level, icon)
  local count = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  if count > 0 then
    return table.concat { count, ' ', icon, '  ' }
  else
    return ''
  end
end

M.status = function()
  local clients = vim.lsp.get_active_clients()

  if vim.tbl_count(clients) == 0 then
    return ''
  end

  local attached = false
  for _, client in ipairs(clients) do
    if vim.lsp.buf_is_attached(0, client['id']) then
      attached = true
      break
    end
  end
  if not attached then
    return ''
  end

  local errors = get_diagnostic('Error', '')
  local warnings = get_diagnostic('Warn', '')
  local hints = get_diagnostic('Hint', '')
  local info = get_diagnostic('Info', '')

  if errors == '' and warnings == '' and hints == '' and info == '' then
    -- Only show progress if there are no diagnostics
    local progress_messages = vim.lsp.util.get_progress_messages()
    if vim.tbl_count(progress_messages) > 0 then
      local now = vim.loop.now()
      if now - M.last_spin_update > spin_update_ms then
        M.spin_frame = (M.spin_frame + 1) % spinner_frame_count
        M.last_spin_update = now
      end
      return table.concat { spinner_frames[M.spin_frame + 1], '  ' }
    else
      return '  '
    end
  else
    return table.concat { errors, warnings, hints, info }
  end
end

return M
