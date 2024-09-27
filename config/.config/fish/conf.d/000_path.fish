fish_add_path -g /usr/local/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.cargo/bin
fish_add_path -g $HOME/Sync/scripts

switch (uname)
    case Darwin
        set -x PNPM_HOME /Users/ian/Library/pnpm
        set -x BREW_DIR /opt/homebrew
        fish_add_path -g $PNPM_HOME
end

if type -q $BREW_DIR/bin/brew
    fish_add_path -g $BREW_DIR/bin
    fish_add_path -g $BREW_DIR/opt/make/libexec/gnubin
    fish_add_path -g $BREW_DIR/opt/ruby/bin
    fish_add_path -g $BREW_DIR/lib/ruby/gems/3.0.0/bin
    # fish_add_path -g $BREW_DIR/opt/llvm/bin
end
