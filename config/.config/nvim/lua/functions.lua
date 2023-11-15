local M = {}

M.telescope_help_tags = function()
  require('telescope.builtin').help_tags {
    attach_mappings = function(_, map)
      local select_vertical = require('telescope.actions').select_vertical
      map('i', '<CR>', select_vertical)
      map('n', '<CR>', select_vertical)
      return true
    end,
  }
end

local is_inside_work_tree = {}

M.telescope_project_files = function()
  local opts = {}
  local builtin = require('telescope.builtin')

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

return M
