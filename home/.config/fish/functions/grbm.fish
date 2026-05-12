function grbm --wraps 'git rebase' --description 'alias grbm git rebase -i origin/main'
    git rebase -i $argv origin/main;
end
