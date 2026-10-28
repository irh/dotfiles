function gci --wraps 'git commit -v' --description 'alias gci git commit -v'
    git commit -v $argv
end
