curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

rustup target add \
  wasm32-unknown-unknown

rustup component add \
  rust-analyzer \
  rust-src \
  rustfmt

cargo install --locked \
  cargo-binstall \

cargo binstall -y \
  cargo-bloat \
  cargo-lipo \
  cargo-sweep \
  cargo-tree \
  cargo-watch \
  harper-ls \
  just-lsp \
  typstyle \
  mlc \
  watchexec-cli \
  wasm-pack

cargo install --git https://github.com/Myriad-Dreamin/tinymist --locked tinymist
