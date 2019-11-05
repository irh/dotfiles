function gcl --wraps 'git clone' --description 'alias gcl git clone --recursive'
    git clone --recursive $argv;
end
