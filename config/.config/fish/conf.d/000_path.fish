set -x PATH \
  /usr/local/bin \
  $HOME/.cargo/bin \
  $PATH

switch (uname)
case Darwin
  set -x PNPM_HOME "/Users/ian/Library/pnpm"

  set -x PATH \
    /opt/homebrew/bin \
    $HOME/.homebrew/bin \
    "$PNPM_HOME" \
    $PATH
end

if type -q brew
  set -x BREW_DIR (brew --prefix)
  set -x PATH \
    $BREW_DIR/opt/make/libexec/gnubin \
    $BREW_DIR/opt/ruby/bin \
    $BREW_DIR/lib/ruby/gems/3.0.0/bin \
    $PATH
  set -g fish_user_paths \
    $BREW_DIR/opt/llvm/bin \
    $fish_user_paths
end

