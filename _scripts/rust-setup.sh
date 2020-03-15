curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup component add rust-src rustfmt
cargo install cargo-tree cargo-watch sccache
