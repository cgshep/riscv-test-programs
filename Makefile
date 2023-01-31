# See https://github.com/riscv-collab/riscv-gnu-toolchain
# for acquiring the standard RISC-V gcc toolchain.
CC=riscv64-unknown-elf-gcc
ASM_OUTPUT:=./asm-out
SOURCES=$(wildcard *.c)

# Target rv32i ISA and ilp32 ABI
CFLAGS=-march=rv32i -mabi=ilp32
DEPS=$(wildcard *.h)

/%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

all: gccasm sha3.o main.o
	$(CC) $(CFLAGS) -o main sha3.o main.o 


gccasm: $(SOURCES)
	mkdir -p $(ASM_OUTPUT)
# -S: ASM-only output
	$(CC) -S $(CFLAGS) $(SOURCES)
	mv *.s $(ASM_OUTPUT)	


.PHONY: clean
clean:
	rm -rf *.o *.s *.out $(ASM_OUTPUT) $(OBJ_OUTPUT)
