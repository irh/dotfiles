function gci --wraps 'git commit' --description 'alias gci git commit -v'
    git commit -v $argv
end
