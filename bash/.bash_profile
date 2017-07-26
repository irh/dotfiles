if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Setting PATH for Python 2.8
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.8/bin:${PATH}"
export PATH

# added by Anaconda3 4.1.1 installer
# export PATH="/Users/ian/.anaconda3/bin:$PATH"
