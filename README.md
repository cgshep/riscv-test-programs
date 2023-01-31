# riscv-test-programs
Examples of converting C programs to RISC-V assembly (RV32I, ILP32).

## Requirements
- Install the RISC-V GCC toolchain from [https://github.com/riscv-collab/riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain)

## Usage

1. ``make`` to produce ASM files in ``./asm-out`` and the binary ``main``. Note that the ASM files are a result of the RISC-V GCC with the ``-S`` flag. The results contain pseudoinstructions that won't actually be the ones executed by the CPU
2. To get the actual binary instructions, use the RISC-V objdump on the ``main`` binary with ``riscv64-unknown-elf-objdump -d -M no-aliases main``