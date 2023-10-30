if [[ "$OSTYPE" == "darwin"* ]]; then
  cd _homebrew
  brew bundle --verbose
  # Link lldb-vscode, don't link the rest of LLVM
  ln -s $(brew --prefix)/opt/llvm/bin/lldb-vscode $(brew --prefix)/bin/
  cd ..
fi

source _scripts/stow.sh

source _scripts/rust-setup.sh
source _scripts/node-setup.sh

pip3 install -r _pip/packages3.txt
julia _julia/packages.jl

source _scripts/neovim-setup.sh
source _scripts/tmux-setup.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  stow Library
  source _scripts/setup-mac-preferences.sh
fi
