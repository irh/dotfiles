if set -q PNPM_HOME
    fish_add_path -g "$PNPM_HOME"
    fish_add_path -g "$PNPM_HOME/bin"
end
