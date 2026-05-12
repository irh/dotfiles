function gcp --wraps 'git checkout' --description 'alias gcp git cherry-pick'
    git cherry-pick $argv;
end
