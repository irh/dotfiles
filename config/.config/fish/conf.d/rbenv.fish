if type -q rbenv
    status --is-interactive; and rbenv init - --no-rehash fish | source
end
