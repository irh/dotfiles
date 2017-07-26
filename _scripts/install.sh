cd _homebrew
brew bundle install
cd ..

source _scripts/vim-setup.sh

stow stow
stow git
stow vim

pip2 install -r _pip/packages2.txt
