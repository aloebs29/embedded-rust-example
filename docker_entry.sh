echo "*** PRINT ELF HEADERS ***"
cargo readobj --bin embedded-rust-example -- --file-headers

echo "\n\n*** PRINT SIZE OF LINKER SECTIONS ***"
cargo size --bin embedded-rust-example --release -- -A

# NOTE: No extra newlines needed here, as cargo size has several trailing newlines.
echo "*** RUN HELLO WORLD PROGRAM ON QEMU ***"
cargo run
