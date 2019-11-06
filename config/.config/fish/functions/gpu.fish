function gpu --wraps 'git pull' --description 'alias gpu git pull --prune'
    git pull --prune $argv
end
