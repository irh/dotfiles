function grbi --wraps 'git rebase' --description 'alias grbi git rebase -i'
    git rebase -i $argv;
end
