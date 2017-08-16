cd _homebrew
brew bundle install
cd ..

source _scripts/vim-setup.sh

stow stow

stow bash
stow git
stow vim

pip2 install -r _pip/packages2.txt
source _npm/npm-install-global.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  source _scripts/setup-mac-preferences.sh
fi
