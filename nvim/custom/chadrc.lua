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

return M
