function xtree --wraps exa
  exa --tree --git-ignore --ignore-glob=.git/ --no-permissions --no-user --icons $argv;
end
