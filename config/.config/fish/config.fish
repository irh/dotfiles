set -x PATH /usr/local/bin $HOME/.cargo/bin $PATH
set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8

set autojump_path (brew --prefix)/share/autojump/autojump.fish
if test -e $autojump_path
  source $autojump_path
end
