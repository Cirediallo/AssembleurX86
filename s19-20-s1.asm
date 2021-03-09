section .data
s1: db 'bonsoir', 0
s2: db 'bonsoir', 0

end: db 'End of program',10
len_end: equ $-end

eol: db 10
i: db 0

different: db 'Difference', 10
len_different: equ $-different

equal: db 'Egalite', 10
len_equal: equ $-equal

section .text
global _start
_start:
mov eax, 0
while:	
	
	mov edi, s1 ;move in edi the content of the string s1
	add edi, eax
	mov bh, [edi] ; bh contient le i ème char

	mov esi, s2
	add esi, eax
	mov bl, [esi]

	;add edi, eax ;we make edi to the ith character of the string s1
	;add esi, eax ;same for the string s2

	cmp bh, bl ;we compare those two ith characters
	jne end_while 

	cmp bh, 0 
	je end_while

	
	cmp eax, 10 ;we compare to 10(the number not the end of line) <- not not sure this is true 
	jae end_while

	
	inc eax
	jmp while

end_while:
	;the if statement

	cmp bh, bl
	;je equality 
	jne difference
	
equality:
	mov eax, 4
	mov ebx, 1
	mov ecx, equal
	mov edx, len_equal
	int 80h

	jmp end_prog

difference:
	mov eax, 4
	mov ebx, 1
	mov ecx, different
	mov edx, len_different
	int 80h
	
	;jmp end_prog


	;jmp end_prog ;after printing "Egalité" move at the end of the programme



end_prog: 
	mov eax, 4
	mov ebx, 1
	mov ecx, end
	mov edx, len_end
	int 80h

	;we leave properly the program or it will throw a segmentation fault
	mov eax, 1
	mov ebx, 0
	int 80h

