global main
extern printf

section .data
string:		db 'iteration counter:  %d',10,0

iterations: equ 5

section .bss
counter: resd 1

section .text

main:

;warning - an unaligned stack!

mov	dword [counter],0

for_loop:			;naive!

cmp	dword [counter], iterations
je	end_loop


inc	byte [counter]

mov	rdi, string
mov	esi, [counter]
mov	eax, 0
call	printf

jmp	for_loop

end_loop:

mov	eax,1			;SYS_EXIT
mov	ebx,0			;return value=0
int	80h

