set -gx PATH /usr/local/bin $PATH
set -gx EDITOR nvim

set autojump_path (brew --prefix)/share/autojump/autojump.fish
if test -e $autojump_path
  source $autojump_path
end
