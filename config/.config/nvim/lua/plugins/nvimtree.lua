return {
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('nvim-tree').setup {
      -- Disable netrw
      disable_netrw = true,
      -- Don't auto-open when opening a new tab
      open_on_tab = false,
      -- Keep the cursor on the first letter of the filename when moving in the tree
      hijack_cursor = true,
      actions = {
        open_file = {
          resize_window = false,
          window_picker = {
            enable = false,
          },
        },
      },
      filesystem_watchers = {
        enable = false,
      },
      filters = {
        -- Show dotfiles by default, toggle with H
        dotfiles = false,
      },
      git = {
        enable = false,
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
      },
      -- Highlight the focused file in the tree
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
    }
  end
}
