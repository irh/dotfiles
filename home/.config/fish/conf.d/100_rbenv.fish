if status is-interactive; and command -q rbenv
    rbenv init - --no-rehash fish | source
end
