build-and-run:
	yasm -f elf64 -gdwarf2 areacode.asm -o areacode.o
	ld areacode.o -o my-program-practice
	@echo "Done"
