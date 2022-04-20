local M = {}

M.ui = {
   theme = "penokai",
}

local user_plugins = require "custom.plugins" 
local plugin_configs = require "custom.plugins.configs"

M.plugins = {
  default_plugin_config_replace = {
    nvim_treesitter = plugin_configs.treesitter,
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig"
    }
  },

  install = user_plugins,
}

M.mappings = {
  plugins = {
    bufferline = {
       next_buffer = "<TAB>",
       prev_buffer = "<S-Tab>",
    },
 
    -- comment = {
    --    toggle = "<leader>/",
    -- },
 
    -- map to <ESC> with no lag
    -- better_escape = { -- <ESC> will still work
    --    esc_insertmode = { "jk" }, -- multiple mappings allowed
    -- },
 
    -- lspconfig = {
    --    declaration = "gD",
    --    definition = "gd",
    --    hover = "K",
    --    implementation = "gi",
    --    signature_help = "gk",
    --    add_workspace_folder = "<leader>wa",
    --    remove_workspace_folder = "<leader>wr",
    --    list_workspace_folders = "<leader>wl",
    --    type_definition = "<leader>D",
    --    rename = "<leader>ra",
    --    code_action = "<leader>ca",
    --    references = "gr",
    --    float_diagnostics = "ge",
    --    goto_prev = "[d",
    --    goto_next = "]d",
    --    set_loclist = "<leader>q",
    --    formatting = "<leader>fm",
    -- },
 
    nvimtree = {
       toggle = "<leader>e",
       focus = "<leader>E",
    },
 
    telescope = {
       buffers = "<leader>b",
       find_files = "<leader>f",
       find_hiddenfiles = "",
       git_commits = "<leader>Gc",
       git_status = "<leader>Gs",
       help_tags = "<leader>h",
       live_grep = "<leader>g",
       oldfiles = "",
       themes = "<leader>th", -- NvChad theme picker
    },
  }
}

return M
