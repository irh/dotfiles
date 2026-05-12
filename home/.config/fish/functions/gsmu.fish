function gsmu --wraps 'git submodule update' --description 'alias gsmu git submodule update --init --recursive'
    git submodule update --init --recursive $argv;
end
