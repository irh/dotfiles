set -x PATH \
  /usr/local/bin \
  $HOME/.cargo/bin \
  $PATH

if type -q brew
  set -x BREW_DIR (brew --prefix)
  set -x PATH \
    $BREW_DIR/bin \
    $BREW_DIR/opt/make/libexec/gnubin \
    $BREW_DIR/opt/ruby/bin \
    $BREW_DIR/lib/ruby/gems/3.0.0/bin \
    $PATH
  set -g fish_user_paths \
    $BREW_DIR/opt/llvm/bin \
    $fish_user_paths
end

