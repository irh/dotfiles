curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

rustup target add \
  wasm32-unknown-unknown

rustup component add \
  rust-analyzer \
  rust-src \
  rustfmt

cargo install --locked \
  cargo-bloat \
  cargo-lipo \
  cargo-sweep \
  cargo-tree \
  cargo-watch \
  harper-ls \
  mlc \
  watchexec-cli \
  wasm-pack
