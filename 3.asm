section .data
	eol: db 10
	
	end: db 'Fin du programme'
	elen: equ $-end

	message: db 'Ce programme demande des caracteres et les affiches',10
	mlen: equ $-message
	
	n: db 0
	

section .txt
global _start
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, message
	mov edx, mlen
	int 80h
	
syscall_read:
	
	;on redemande la saisie
	mov eax, 3
	mov ebx, 1
	mov ecx, n
	mov edx, 1
	int 80h
	
	cmp byte [n], ' '
	je end_prog

	mov eax, 4
	mov ebx, 1
	mov ecx, n
	mov edx, 1
	int 80h
	
	jmp syscall_read


end_prog:
	mov eax, 4
	mov ebx, 1
	mov ecx, eol
	mov edx, 1
	int 80h
	
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
