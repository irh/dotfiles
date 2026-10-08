if path is -d "$HOME/.bun"
    set -gx BUN_INSTALL "$HOME/.bun"
end
fish_add_path -g "$HOME/.bun/bin"
