function xtree --wraps eza
    eza --tree --git-ignore --ignore-glob=.git/ --no-permissions --no-user --icons $argv
end
