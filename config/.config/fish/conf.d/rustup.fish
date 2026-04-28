if path is -q -f "$HOME/.cargo/env.fish"
    fish_add_path -g $HOME/.cargo/bin
    source "$HOME/.cargo/env.fish"
end
