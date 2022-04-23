-- Set global nvimtree settings before calling setup
local g = vim.g

g.nvim_tree_show_icons = {
  folders = 1,
  files = 0,
  git = 1,
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★",
  },
  folder = {
    default = "",
    empty = "",
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  },
}

local M = {}

M.setup = function(override_flag)
  require('nvim-tree').setup {
    filters = {
      -- Don't show dotfiles by default, toggle with H
      dotfiles = true,
    },
    -- Disable netrw
    disable_netrw = true,
    -- Don't auto-open when opening a new tab
    open_on_tab = false,
    -- Keep the cursor on the first letter of the filename when moving in the tree
    hijack_cursor = true,
    -- Highlight the focused file in the tree
    update_focused_file = {
      enable = true,
      update_cwd = false,
    },
    git = {
      -- Disable git status icons
      enable = false,
      -- Don't hide files based on .gitignore
      ignore = false,
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = true,
      }
    }
  }
end

return M
