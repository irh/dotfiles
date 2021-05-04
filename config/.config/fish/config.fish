set -x PATH /opt/homebrew/bin /usr/local/bin $HOME/.cargo/bin $HOME/dev/flutter/bin $PATH

set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8
set -x RUSTC_WRAPPER sccache

set autojump_path (brew --prefix)/share/autojump/autojump.fish
if test -e $autojump_path
  source $autojump_path
end
set -g fish_user_paths "/opt/homebrew/opt/llvm/bin" $fish_user_paths
