if [[ "$OSTYPE" == "darwin"* ]]; then
  cd _homebrew
  brew bundle --verbose
  cd ..
fi

stow stow

stow bash
stow config
stow git
stow vim

source _scripts/vim-setup.sh
source _scripts/neovim-setup.sh

source _scripts/rust-setup.sh
pip2 install -r _pip/packages2.txt
pip3 install -r _pip/packages3.txt
julia _julia/packages.jl
source _npm/npm-install-global.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  stow Library
  source _scripts/setup-mac-preferences.sh
fi
