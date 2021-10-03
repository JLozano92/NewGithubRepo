build-and-run:
	yasm -f elf64 -gdwarf2 practice.asm -o practice.o
	ld practice.o -o my-program-practice
	@echo "Done"
