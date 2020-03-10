section .data	
	end: db 10,'End of Program',10
	endl: equ $-end
	n: db 0
	int: dd 0
	eol: db 10

	overflow: db 'There is a overflow',10
	loverflow: equ $-overflow


section .txt
global _start
_start:

loop_write:
	mov eax, 3
	mov ebx, 1
	mov ecx, n
	mov edx, 1
	int 80h
	
	sub byte [n],'0' ; transform n to number

	mov eax, 4
	mov ebx, 1
	mov ecx, n
	mov edx, 1
	int 80h
	
end_prog:

	mov eax, 4
	mov ebx, 1
	mov ecx, end
	mov edx, endl
	int 80h

	ret
	;mov eax,1
	;xor ebx, ebx
	;int 80h
over:
	mov eax, 4
	mov ebx, 1
	mov ecx, overflow
	mov edx, loverflow
	int 80h

	mov eax, 1
	xor ebx, ebx
	int 80h
