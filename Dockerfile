FROM rust:1.67

RUN apt-get update && apt-get install -y gdb-multiarch openocd qemu-system-arm && rm -rf /var/lib/apt/lists/*

RUN rustup target add thumbv7m-none-eabi
RUN cargo install cargo-binutils
RUN rustup component add llvm-tools-preview

WORKDIR /usr/src/myapp
COPY . .
ENTRYPOINT ./docker_entry.sh
