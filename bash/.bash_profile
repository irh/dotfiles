if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

if [ -z $SSH_AGENT_PID ]; then
  eval `ssh-agent -s` &> /dev/null
fi

ssh-add -K ~/.ssh/id_rsa &> /dev/null


# Setting PATH for Python 2.8
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.8/bin:${PATH}"

export PATH="$HOME/.cargo/bin:$PATH"
