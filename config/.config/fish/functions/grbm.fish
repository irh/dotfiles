function grbm --wraps 'git rebase' --description 'alias grbm git rebase -i origin/master'
    git rebase -i $argv origin/master;
end
