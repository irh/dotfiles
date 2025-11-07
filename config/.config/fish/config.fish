# locale
set -x LC_ALL en_US.UTF-8

# env vars
set -x BACON_PREFS $HOME/.config/bacon/prefs.toml
set -x EDITOR hx
set -x HELIX_RUNTIME $HOME/.config/helix/runtime
set -x OLLAMA_API_BASE http://studio:11434
set -x PYENV_ROOT $HOME/.pyenv
set -x RUSTC_WRAPPER sccache
