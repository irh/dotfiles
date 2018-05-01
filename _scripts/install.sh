if [[ "$OSTYPE" == "darwin"* ]]; then
  cd _homebrew
  brew bundle --verbose
  cd ..
fi

source _scripts/vim-setup.sh
source _scripts/neovim-setup.sh

stow stow

stow bash
stow config
stow git
stow vim

pip2 install -r _pip/packages2.txt
julia _julia/packages.jl
source _npm/npm-install-global.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  stow Library
  source _scripts/setup-mac-preferences.sh
fi
