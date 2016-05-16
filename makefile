all:integral
asmintegral.o:asmintegral.asm
	nasm -f elf32 -o asmintegral.o asmintegral.asm
integral:integral.o asmintegral.o
	gcc -m32 -o integral integral.o asmintegral.o
integral.o:integral.c 
	gcc -m32 -std=c11 -c -o integral.o integral.c
clean:
	rm *.o
