section .data
n: db 0

message: db 'Entrez un nombre: '
mlen: equ $-message

etoile: db '*'

end: db 10,'Fin programme',10
elen: equ $-end

section .text
global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, message
	mov edx, mlen
	int 80h	

	jmp user_input

	jmp boucle

user_input:
	mov eax, 3
	mov ebx, 0
	mov ecx, n
	mov edx, 1
	int 80h

	sub byte [n], '0'; n receive a string we've to transform it to string

boucle:
	mov cl, [n]
	cmp cl, 0
	je end_prog
	
	dec byte [n]
 
	;jmp print_star
	mov eax, 4
	mov ebx, 1
	mov ecx, etoile
	mov edx, 1
	int 80h
	
	;int 80h
		
	jmp boucle
;with instruction jmp print_star in boucle it print a star and end the program I don't know why

print_star:
	mov eax, 4
	mov ebx, 1
	mov ecx, etoile
	mov edx, 1
	int 80h

	;ret

end_prog:
	mov eax, 4
	mov ebx, 1
	mov ecx, end
	mov edx, elen
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h

;#Exercice 2:

;#Question 1: Les interruptions utilisés dans le programme précedent est int 80h



