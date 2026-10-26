function ibrew --wraps /usr/local/bin/brew --description 'alias ibrew=/usr/local/bin/brew'
    arch --x86_64 /usr/local/bin/brew $argv
end
