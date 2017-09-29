if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Setting PATH for Python 2.8
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.8/bin:${PATH}"
export PATH="/usr/local/opt/llvm/bin:$PATH"
