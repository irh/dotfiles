local M = {}

M.treesitter = {
   ensure_installed = {
      "bash",
      "c",
      "css",
      "elm",
      "fish",
      "glsl",
      "haskell",
      "html",
      "javascript",
      "json",
      "julia",
      "lua",
      "markdown",
      "rust",
      "swift",
      "toml",
      "typescript",
      "vim",
      "wgsl",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}

return M
