function grbc --wraps 'git rebase' --description 'alias grbc git rebase --continue'
    git rebase --continue $argv;
end
