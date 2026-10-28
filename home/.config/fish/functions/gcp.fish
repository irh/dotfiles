function gcp --wraps 'git cherry-pick -x' --description 'alias gcp git cherry-pick -x'
    git cherry-pick -x $argv

end
