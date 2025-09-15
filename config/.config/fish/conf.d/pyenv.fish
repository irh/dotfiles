if type -q pyenv
    # fish_add_path -g $PYENV_ROOT/shims
    pyenv init - | source
end
