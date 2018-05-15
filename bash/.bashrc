command_exists() {
  type "$1" &> /dev/null;
}

[ -f ~/.bash/.bashrc_local ] && source ~/.bash/.bashrc_local

if [ -f ~/.bash/.aliases.sh ]; then
  source ~/.bash/.aliases.sh
fi

if [ -f ~/.bash/.prompt.sh ]; then
  source ~/.bash/.prompt.sh
fi

if [ -f ~/.bash/scripts/git-completion.sh ]; then
  source ~/.bash/scripts/git-completion.sh
fi

if [ -f ~/.bash/scripts/wrap-aliases.sh ]; then
  source ~/.bash/scripts/wrap-aliases.sh
fi

if command_exists brew ; then
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
fi

if [[ $OSTYPE == "linux-gnu" ]]; then
  export PATH="/home/iho/.linuxbrew/bin:$PATH"
fi

PATH="/usr/local/bin:$PATH:/usr/local/sbin"
PATH="~/.bash/scripts:$PATH"
PATH="/usr/local/Cellar/ruby/2.1.2/bin:$PATH"
PATH="/usr/local/heroku/bin:$PATH"

export PYTHONSTARTUP="$HOME/.pyrc"

export NODE_PATH="/usr/local/lib/node_modules"
export ELM_HOME="/usr/local/lib/node_modules/elm/Elm-Platform/0.16.0/share/"

export CTEST_OUTPUT_ON_FAILURE=1

export LIBCLANG_LLVM_CONFIG_EXECUTABLE=/usr/local/opt/llvm/bin/llvm-config

# This setting is for the new UTF-8 terminal support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=nvim

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS="--preview='head -$LINES {}' -m"

# auto cd into directories
if [[ $BASH_VERSION > 4.*  ]]; then
  shopt -s autocd
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

