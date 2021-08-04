function fish_prompt
  echo ""
  # Path
  set_color cyan
  echo -n (dirs)
  # Git info
  set -l repo (git rev-parse --show-toplevel 2>/dev/null)
  if test $repo
    # Branch name
    git diff --quiet --ignore-submodules
    if test $status -gt 0
      set_color red
    else
      set_color green
    end
    set -l branch_name (git branch | sed -n "/^*/s/^* //p")
    if test $branch_name
      echo -n " $branch_name"
    end
    # Upstream status
    set_color yellow
    set -l upstream_counts (git rev-list --count --left-right "HEAD@{upstream}...HEAD" 2>/dev/null)
    if test $upstream_counts
      switch $upstream_counts
        case "0*0"
          ;;
        case "0*"
          echo -n " ↑"
        case "*0"
          echo -n " ↓"
        case "*"
          echo -n " ⇵"
      end
    else
      echo -n " ?"
    end
    echo -n " "
  end
  # Job count
  # Autojump sometime leaves a job running after changing directory, so filter it from list
  set -l jobcount (jobs | sed -e "/autojump/d" | wc -l | sed -e "s/ //g")
  if test $jobcount -gt 0
    set_color yellow
    echo -n "($jobcount)"
  end
  # Prompt, assuming fish_vi_key_bindings
  set_color normal
  echo ""
  switch $fish_bind_mode
    case default
      echo '✪ '
    case insert
      echo '» '
    case replace_one
      echo '★ '
    case visual
      echo "❖ "
  end
end
