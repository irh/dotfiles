function gdf --wraps 'git diff' --description 'alias gdf git diff --ignore-submodules'
    git diff --ignore-submodules $argv;
end
