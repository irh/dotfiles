# Vim keybindings
set --global fish_key_bindings fish_hybrid_key_bindings

# locale
set -x LC_ALL en_US.UTF-8

# env vars
set -x BACON_PREFS $HOME/.config/bacon/prefs.toml
set -x EDITOR kes
set -x HELIX_RUNTIME $HOME/.config/helix/runtime
set -x KES_CONFIG $HOME/.config/kes/default_config
set -x OLLAMA_API_BASE http://studio:11434
set -x RUSTC_WRAPPER sccache
