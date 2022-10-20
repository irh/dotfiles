-- Set global nvimtree settings before calling setup

local M = {}

M.setup = function()
  require('nvim-tree').setup {
    filters = {
      -- Show dotfiles by default, toggle with H
      dotfiles = false,
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
        resize_window = false,
        window_picker = {
          enable = false,
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          file = false,
          folder = true,
          git = true,
        },
        glyphs = {
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
      }
    }
  }
end

return M
