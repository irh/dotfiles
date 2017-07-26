# arrows
if [ "$(locale charmap 2>/dev/null)" = "UTF-8" ]; then
  __arrow_up="↑"
  __arrow_down="↓"
  __arrow_both="⇵"
else
  __arrow_up="<"
  __arrow_down=">"
  __arrow_both="<>"
fi
__tab=`printf '\t'`

# colours
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_yellow=`tput setaf 3`
c_blue=`tput setaf 4`
c_cyan=`tput setaf 6`
c_reset=`tput sgr0`

export LS_COLORS='di=36:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

branch_color() {
  if git diff --quiet 2>/dev/null >&2
  then
    echo -ne ${c_green}
  else
    echo -ne ${c_red}
  fi
}

xcode_update_required() {
  local update_required_cmd="$1/generate_projects.py"
  if test -x "$update_required_cmd" && ! "$update_required_cmd" --test --quiet --ccache --64
  then
    echo -ne "${c_red}\nXcode project is out of date${c_reset}"
  fi
}

upstream_status() {
  counts="$(git rev-list --count --left-right HEAD@{upstream}...HEAD 2>/dev/null)"
  case "$counts" in
  "") # no upstream
    echo -ne " ?" ;;
  "0${__tab}0") # equal to upstream
    #echo -ne " =" ;;
    ;;
  "0${__tab}"*) # ahead of upstream
    echo -ne " $__arrow_up" ;;
  *"${__tab}0") # behind upstream
    echo -ne " $__arrow_down" ;;
  *)            # diverged from upstream
    echo -ne " $__arrow_both" ;;
  esac
}

git_branch() {
  local repo_root="`git rev-parse --show-toplevel 2>/dev/null`"
  if [ -n "$repo_root" ]; then
    echo -ne "["
    echo -ne "$(branch_color)$(git branchname)"
    echo -ne "${c_yellow}$(upstream_status)"
    echo -ne "${c_reset}]"
    echo -ne "$(xcode_update_required $repo_root)"
  fi
}

showtime() {
  echo -ne "[${c_blue}$(date +%k:%M:%S)${c_reset}]"
}

jobcount() {
  local result="`jobs -s | wc -l | sed -e "s/ //g"`"
  echo $result
}

showjobcount() {
  local jobs=$(jobcount)
  if [ "$jobs" != "0" ]; then
    echo -ne "${c_yellow}($jobs)${c_reset}"
  fi
}

PS1='\n$(showtime) $(git_branch) $(showjobcount)\n\[${c_cyan}\]\w\[${c_reset}\] » '

