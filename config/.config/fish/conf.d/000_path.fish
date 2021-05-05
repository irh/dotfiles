set -x PATH \
  /opt/homebrew/bin \
  /usr/local/bin \
  $HOME/.cargo/bin \
  $HOME/dev/flutter/bin \
  $PATH

set -x BREW_DIR (brew --prefix)

set -g fish_user_paths $BREW_DIR/opt/llvm/bin $fish_user_paths
