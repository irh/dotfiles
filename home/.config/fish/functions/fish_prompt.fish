function fish_prompt
    # Prepare prompt elements
    set -l prompt_time (date +%H:%M:%S)
    set -l host_name (hostname -s)
    set -l current_path (prompt_pwd --dir-length=1 --full-length-dirs=2)
    set -l jobcount (count (jobs -p))

    # Git info
    set -l branch_name ""
    set -l branch_dirty 0
    set -l upstream_indicator ""
    set -l repo (git rev-parse --show-toplevel 2>/dev/null)
    if test $repo
        # Branch name
        git diff --quiet
        if test $status -gt 0
            set branch_dirty 1
        end
        set branch_name (git branch | sed -n "/^*/s/^* //p")
        # Upstream status
        set -l upstream_counts (git rev-list --count --left-right "HEAD@{upstream}...HEAD" 2>/dev/null)
        if test $upstream_counts
            switch $upstream_counts
                case "0*0"

                case "0*"
                    set upstream_indicator "↑"
                case "*0"
                    set upstream_indicator "↓"
                case "*"
                    set upstream_indicator "⇵"
            end
        else
            set upstream_indicator "?"
        end
    end

    # Prompt, assuming fish_vi_key_bindings
    set -l mode_indicator ""
    switch $fish_bind_mode
        case default
            set mode_indicator '✪'
        case insert
            set mode_indicator '»'
        case replace_one
            set mode_indicator '★'
        case visual
            set mode_indicator '❖'
    end

    # Render time
    echo ""
    set_color 888
    echo -n "$prompt_time"

    # Render git info
    if test -n "$branch_name"
        if test $branch_dirty -gt 0
            set_color red
        else
            set_color green
        end
        echo -n " $branch_name"
    end
    if test -n "$upstream_indicator"
        set_color yellow
        echo -n " $upstream_indicator"
    end

    # Render job count
    if test $jobcount -gt 0
        set_color yellow
        echo -n " ($jobcount)"
    end

    set_color normal
    echo ""

    # Render host and abbreviated path
    set_color 4c8e9a
    echo -n "$host_name "
    set_color cyan
    echo -n "$current_path"
    set_color normal
    echo ""

    # Render mode indicator
    if test -n "$mode_indicator"
        echo "$mode_indicator "
    end
end
