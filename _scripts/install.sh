if [[ "$OSTYPE" == "darwin"* ]]; then
  cd _homebrew
  brew bundle --verbose
  cd ..
fi

source _scripts/vim-setup.sh

stow stow

stow bash
stow git
stow vim

pip2 install -r _pip/packages2.txt
source _npm/npm-install-global.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  stow Library
  source _scripts/setup-mac-preferences.sh
fi
