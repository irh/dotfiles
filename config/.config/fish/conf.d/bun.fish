if type -q bun
    set -x BUN_INSTALL $HOME/.bun
    fish_add_path -g $BUN_INSTALL/bin
end
