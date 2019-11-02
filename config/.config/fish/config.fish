set -x PATH /usr/local/bin $HOME/.cargo/bin $PATH

set -x EDITOR nvim
set -x LC_ALL en_US.UTF-8
set -x RUSTC_WRAPPER sccache

set autojump_path (brew --prefix)/share/autojump/autojump.fish
if test -e $autojump_path
  source $autojump_path
end

abbr -g b 'bat'
abbr -g c 'cargo'
abbr -g g 'git'
abbr -g gad 'git add'
abbr -g gco 'git checkout'
abbr -g gci 'git commit -v'
abbr -g gdf 'git diff --ignore-submodules'
abbr -g gps 'git push'
abbr -g gpu 'git pull --prune'
abbr -g gst 'git status'
