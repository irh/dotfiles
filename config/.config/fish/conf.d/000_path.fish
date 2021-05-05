set -x PATH \
  /opt/homebrew/bin \
  /usr/local/bin \
  $HOME/.cargo/bin \
  $HOME/dev/flutter/bin \
  $PATH

set -g fish_user_paths (brew --prefix)/opt/llvm/bin $fish_user_paths
