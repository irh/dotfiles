function ta --wraps 'tmux' --description 'alias ta "tmux attach -t"'
    tmux attach -t $argv
end
