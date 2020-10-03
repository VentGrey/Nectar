#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable --profile complete -y

echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.bashrc
