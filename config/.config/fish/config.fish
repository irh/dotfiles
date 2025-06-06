# locale
set -x LC_ALL en_US.UTF-8

# env vars
set -x ANDROID_NDK_HOME ~/Library/android/sdk/ndk/current
set -x EDITOR hx
set -x OLLAMA_API_BASE http://studio:11434
set -x HELIX_RUNTIME ~/.config/helix/runtime
set -x RUSTC_WRAPPER sccache

set -x PYENV_ROOT $HOME/.pyenv

if type -q mcfly
    mcfly init fish | source
end
