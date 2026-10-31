function fixup --wraps 'git commit -v --fixup' --description 'alias fixup git commit -v --fixup'
    git commit -v --fixup $argv
end
