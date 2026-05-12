function grba --wraps 'git rebase' --description 'alias grba git rebase --abort'
    git rebase --abort $argv;
end
