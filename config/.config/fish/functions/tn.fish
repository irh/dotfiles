function tn --wraps 'tmux' --description 'alias tn "tmux new -s"'
    tmux new -s $argv
end
