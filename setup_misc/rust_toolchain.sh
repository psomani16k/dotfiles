#!/bin/bash

# Install rust
echo -e "\033[1;32m|=== INSTALLING THE RUST TOOLCHAIN ===|\033[0m"
curl -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
echo ""

# Installing cargo binstall
echo -e "\033[1;32m|=== INSTALLING CARGO BINSTALL ==="
cargo install cargo-binstall
echo ""

