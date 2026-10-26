function gfe --wraps 'git fetch' --description 'alias gfe git fetch --prune'
    git fetch --prune $argv;
end
