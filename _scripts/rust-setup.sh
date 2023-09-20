curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

rustup component add \
  rust-analyzer \
  rust-src \
  rustfmt

cargo install \
  cargo-bloat \
  cargo-lipo \
  cargo-tree \
  cargo-watch \
  watchexec-cli
