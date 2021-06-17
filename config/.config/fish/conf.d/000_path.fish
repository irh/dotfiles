set -x PATH \
  /opt/homebrew/bin \
  /usr/local/bin \
  $PATH

set -x BREW_DIR (brew --prefix)

set -x PATH \
  $BREW_DIR/opt/make/libexec/gnubin \
  $BREW_DIR/opt/ruby/bin \
  $BREW_DIR/lib/ruby/gems/3.0.0/bin \
  $HOME/.cargo/bin \
  $HOME/dev/flutter/bin \
  $PATH

set -g fish_user_paths \
  $BREW_DIR/opt/llvm/bin \
  $fish_user_paths
