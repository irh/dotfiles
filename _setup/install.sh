#!/bin/zsh

if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! command -v brew &> /dev/null
  then
    echo "homebrew isn't available, exiting"
    exit 1
  fi

  brew bundle --verbose --file _homebrew/Brewfile

  # Link lldb-vscode, don't link the rest of LLVM
  ln -s $(brew --prefix)/opt/llvm/bin/lldb-vscode $(brew --prefix)/bin/
fi

if [[ "$OSTYPE" == "linux"* ]]; then
  source _apt/install.sh
fi

source _setup/stow.sh

source _setup/rust-setup.sh
source _setup/node-setup.sh

# pip3 install -r _pip/packages3.txt
# julia _julia/packages.jl

source _setup/neovim-setup.sh
source _setup/tmux-setup.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  stow Library
  sudo source _setup/setup-mac-preferences.sh

  brew bundle --verbose --file _homebrew/Brewfile-casks
fi
