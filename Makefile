# See https://github.com/riscv-collab/riscv-gnu-toolchain
# for acquiring the standard RISC-V gcc toolchain.
CC=riscv64-unknown-elf-gcc
OUTPUT=./output
SOURCES=$(wildcard *.c)

# Target rv32i ISA and ilp32 ABI with ASM-only output
CFLAGS=-S -march=rv32i -mabi=ilp32

all: $(SOURCES)
	mkdir -p $(OUTPUT)
	$(CC) $(CFLAGS) $(SOURCES)
	mv *.s $(OUTPUT)

.PHONY: clean
clean:
	rm -rf $(OUTPUT)
	rm -f *.o *.s
