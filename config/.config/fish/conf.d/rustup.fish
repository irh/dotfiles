if command -q cargo
    fish_add_path -g $HOME/.cargo/bin
    source "$HOME/.cargo/env.fish"
end
