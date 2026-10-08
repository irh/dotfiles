# Shared environment must precede PATH providers and tool initialization.
## Set the locale to utf8
set -gx LANG en_US.UTF-8

switch (uname)
    case Darwin
        set -gx BREW_DIR /opt/homebrew
        set -gx PNPM_HOME $HOME/Library/pnpm
end
