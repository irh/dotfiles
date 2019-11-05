function gca --wraps 'git commit' --description 'alias gca git commit --amend'
    git commit --amend $argv
end
