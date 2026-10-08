if set -q BREW_DIR
    fish_add_path -g "$BREW_DIR/bin"
    fish_add_path -g "$BREW_DIR/sbin"
    fish_add_path -g "$BREW_DIR/opt/make/libexec/gnubin"
    fish_add_path -g "$BREW_DIR/opt/ruby/bin"
    fish_add_path -g "$BREW_DIR/lib/ruby/gems/3.0.0/bin"
end
