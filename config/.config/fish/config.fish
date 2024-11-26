# locale
set -x LC_ALL en_US.UTF-8

# env vars
set -x ANDROID_NDK_HOME ~/Library/android/sdk/ndk/current
set -x EDITOR hx
set -x RUSTC_WRAPPER sccache
set -x HELIX_RUNTIME ~/.config/helix/runtime

if type -q mcfly
    mcfly init fish | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/ian/.miniconda3/bin/conda
    eval /Users/ian/.miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/Users/ian/.miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/ian/.miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/ian/.miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
