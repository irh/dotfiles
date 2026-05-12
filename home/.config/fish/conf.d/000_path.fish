fish_add_path -g /usr/local/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.scripts

switch (uname)
    case Darwin
        set -x PNPM_HOME $HOME/Library/pnpm
        set -x BREW_DIR /opt/homebrew
        fish_add_path -g $PNPM_HOME
        fish_add_path -g $HOME/Sync/scripts

        if command -q $BREW_DIR/bin/brew
            fish_add_path -g $BREW_DIR/bin
            fish_add_path -g $BREW_DIR/sbin
            fish_add_path -g $BREW_DIR/opt/make/libexec/gnubin
            fish_add_path -g $BREW_DIR/opt/ruby/bin
            fish_add_path -g $BREW_DIR/lib/ruby/gems/3.0.0/bin
        end
end
