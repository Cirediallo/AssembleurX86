section .data
	end: db 10,'Fin programme',10
	lend: equ $-end
	n: db 0
	tmp: db 0
	;table: times 10 resb 1 ;un tableau de 10 cases d'1 octet
	i: dd 0
	
section .txt
global _start

palindrome:
	cmp eax, 0
	je end_prog

	mov ecx, 10
	mov edx, 0
	idiv ecx 
	add edx, '0'
	mov [n], edx
	push eax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, n
	mov edx, 1
	int 80h
	
	pop eax
	jmp palindrome

_start:
	mov eax, 789	
	call palindrome

end_prog: 
	mov eax, 4
	mov ebx, 1
	mov ecx, end
	mov edx, lend
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h


