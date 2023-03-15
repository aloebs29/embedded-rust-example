# Embeddded rust example project

> An example embedded application for ARM Cortex-M microcontrollers using Rust

This project is based off of the Cortex-M Quickstart template found [here](https://github.com/rust-embedded/cortex-m-quickstart).

The example project is built and run within a docker container based on the [official rust image](https://hub.docker.com/_/rust). It uses QEMU to run the application in an emulated environment. Ideally, this project would run on an emulated Cortex-M4F core, however, QEMU does not support this ([see here](https://wiki.qemu.org/Documentation/Platforms/ARM)), so it runs on an emulated Ti LM3S6965 (Cortex-M3).

The docker entrypoint prints the ELF headers, linker section sizes, and then runs a hello world application.

The hello world application executes a simple swap function and prints the result to the terminal (with semihosting).

## Dependencies

To build and run this example project you'll need Docker installed on your system.

## Usage

To build the docker image and run the app from a container, use:
```console
$ docker build -t embedded-rust-template-image .
$ docker run -it --rm --name embedded-rust-template embedded-rust-template-image
```

The output from the run command should look something like:
```console
*** PRINT ELF HEADERS ***
   Compiling semver-parser v0.7.0
   Compiling typenum v1.16.0
   Compiling proc-macro2 v1.0.52
   Compiling version_check v0.9.4
   Compiling semver v0.9.0
   Compiling cortex-m v0.7.7
   Compiling generic-array v0.14.6
   Compiling rustc_version v0.2.3
   Compiling quote v1.0.26
   Compiling unicode-ident v1.0.8
   Compiling nb v1.1.0
   Compiling nb v0.1.3
   Compiling bare-metal v0.2.5
   Compiling void v1.0.2
   Compiling syn v1.0.109
   Compiling vcell v0.1.3
   Compiling volatile-register v0.2.1
   Compiling embedded-hal v0.2.7
   Compiling generic-array v0.12.4
   Compiling generic-array v0.13.3
   Compiling bitfield v0.13.2
   Compiling cortex-m-rt v0.6.15
   Compiling stable_deref_trait v1.2.0
   Compiling as-slice v0.1.5
   Compiling cortex-m-semihosting v0.3.7
   Compiling cortex-m v0.6.7
   Compiling aligned v0.3.5
   Compiling r0 v0.2.2
   Compiling embedded-rust-example v0.1.0 (/usr/src/myapp)
   Compiling panic-halt v0.2.0
   Compiling cortex-m-rt-macros v0.6.15
    Finished dev [unoptimized + debuginfo] target(s) in 8.09s
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           ARM
  Version:                           0x1
  Entry point address:               0x401
  Start of program headers:          52 (bytes into file)
  Start of section headers:          933460 (bytes into file)
  Flags:                             0x5000200
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         5
  Size of section headers:           40 (bytes)
  Number of section headers:         22
  Section header string table index: 20


*** PRINT SIZE OF LINKER SECTIONS ***
   Compiling typenum v1.16.0
   Compiling semver-parser v0.7.0
   Compiling cortex-m v0.7.7
   Compiling version_check v0.9.4
   Compiling semver v0.9.0
   Compiling proc-macro2 v1.0.52
   Compiling rustc_version v0.2.3
   Compiling generic-array v0.14.6
   Compiling bare-metal v0.2.5
   Compiling unicode-ident v1.0.8
   Compiling quote v1.0.26
   Compiling nb v1.1.0
   Compiling nb v0.1.3
   Compiling void v1.0.2
   Compiling vcell v0.1.3
   Compiling syn v1.0.109
   Compiling embedded-hal v0.2.7
   Compiling volatile-register v0.2.1
   Compiling generic-array v0.12.4
   Compiling generic-array v0.13.3
   Compiling stable_deref_trait v1.2.0
   Compiling cortex-m-rt v0.6.15
   Compiling bitfield v0.13.2
   Compiling as-slice v0.1.5
   Compiling cortex-m v0.6.7
   Compiling cortex-m-semihosting v0.3.7
   Compiling aligned v0.3.5
   Compiling r0 v0.2.2
   Compiling embedded-rust-example v0.1.0 (/usr/src/myapp)
   Compiling panic-halt v0.2.0
   Compiling cortex-m-rt-macros v0.6.15
    Finished release [optimized + debuginfo] target(s) in 8.45s
embedded-rust-example  :
section              size        addr
.vector_table        1024         0x0
.text                4392       0x400
.rodata                68      0x1528
.data                   0  0x20000000
.bss                    8  0x20000000
.uninit                 0  0x20000008
.debug_loc           2281         0x0
.debug_abbrev        2412         0x0
.debug_info         19635         0x0
.debug_aranges        856         0x0
.debug_ranges        5240         0x0
.debug_str          28311         0x0
.debug_pubnames     10359         0x0
.debug_pubtypes      3858         0x0
.ARM.attributes        50         0x0
.debug_frame         1736         0x0
.debug_line         12439         0x0
.comment               19         0x0
Total               92688


*** RUN HELLO WORLD PROGRAM ON QEMU ***
    Finished dev [unoptimized + debuginfo] target(s) in 0.02s
     Running `qemu-system-arm -cpu cortex-m3 -machine lm3s6965evb -nographic -semihosting-config enable=on,target=native -kernel target/thumbv7m-none-eabi/debug/embedded-rust-example`
hello, world!
```
