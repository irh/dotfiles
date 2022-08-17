if [[ "$OSTYPE" == "darwin"* ]]; then
  cd _homebrew
  brew bundle --verbose
  cd ..
fi

source _scripts/stow.sh

source _scripts/rust-setup.sh
source _scripts/node-setup.sh

pip3 install -r _pip/packages3.txt
julia _julia/packages.jl

source _scripts/neovim-setup.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  stow Library
  source _scripts/setup-mac-preferences.sh
fi
