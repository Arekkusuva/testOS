mkdir temp
nasm -f elf32 kernel.asm -o temp/kasm.o
gcc -m32 -c kernel.c -o temp/kc.o
ld -m elf_i386 -T link.ld -o testOS/boot/kernel.bin temp/kasm.o temp/kc.o
rm -rf temp
grub-mkrescue -o out/testOS.iso testOS/
# qemu-system-i386 -kernel kernel.bin