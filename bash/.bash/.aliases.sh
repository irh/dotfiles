# allow aliases when using sudo
alias sudo="sudo "

if ! command_exists gls; then
  alias gls=ls
fi

alias ll="gls -AlFvh --color"
alias l="exa --long --all --classify"

alias grep="grep --color=always"
alias grp="grep -ri"

alias less="less -R"
alias ccat="pygmentize -g"

alias vim="vim -p"
alias gvim="gvim -p"
alias mvim="mvim -p"
alias nvim="nvim -p"
alias n="nvim"
alias v="n"

alias clang11++="clang++ --std=c++11 --stdlib=libc++ -I/usr/local/include"
alias clang14++="clang++ --std=c++1y --stdlib=libc++"
alias clang17++="clang++ --std=c++1z --stdlib=libc++"

alias git="hub"
alias g="git"
alias gk="gitk"
alias gad="git add"
alias gbr="git br"
alias gbs="git bs"
alias gca="git ca"
alias gci="git ci"
alias gcl="git cl"
alias gclean="git clean -dff"
alias gco="git co"
alias gcorbm="git corbm"
alias gcp="git cp"
alias gcpa="git cpa"
alias gcpc="git cpc"
alias gdf="git df"
alias gdt="git dt"
alias gfe="git fe"
alias ghi="git hist"
alias gmt="git mt"
alias gps="git push"
alias gpu="git pu"
alias grb="git rebase"
alias grba="git rba"
alias grbc="git rbc"
alias grbi="git rebase -i"
alias grbm="git rbm"
alias grbp="git rbp"
alias gst="git status"
alias gsh="git show"
alias gsm="git sm"
alias gsmf="git smf"
alias gsmi="git smi"
alias gsmu="git smu"

alias cdf="cdiff -s"
alias cdl="cdiff -s -l"

alias groot="cd \`git root\`"

alias c="cucumber"
alias cuke="cucumber"

alias pylab="ipython --pylab"
alias notebook="jupyter notebook"

alias toenglish="trans -t en"
alias togerman="trans -t de"

alias scm="scheme --batch-mode"

alias server="python3 -m http.server 8000"

alias builds="open http://jupiter.office.ableton.com/builds/continuous/"
alias ci="open http://ci/view/FA%20Sound/"
alias pivotal="open https://www.pivotaltracker.com/n/workspaces/26630"

alias weather="curl http://wttr.in"

alias ggl="googler"
