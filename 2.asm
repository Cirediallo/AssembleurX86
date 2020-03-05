section .data
	n: dd 5
	eol: db 10
	star: db '*'

	end: db 'Fin programme';10
	elen: equ $-end

section .txt
global _start
_start:

mov ecx, [n]

line_loop:
	push ecx ;on met ecx sur la pile
	
	mov ecx, [n]
	char_loop:
		push ecx
		
		mov eax, 4
		mov ebx, 1
		mov ecx, star
		mov edx, 1
		int 80h

		pop ecx ; 

	loop char_loop	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, eol
	mov edx, 1
	int 80h

	pop ecx

	loop line_loop
	

end_prog:
	mov eax, 4
	mov ebx, 1
	mov ecx, end
	mov edx, elen
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, eol
	mov edx, 1
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h
