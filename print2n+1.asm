section .data
	valeur db 0
section .text
global _start
_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, valeur
	mov edx, 1
	int 80h
	xor ecx, ecx
	mov cl, [valeur] ; erreur 4 : recuperation de la valeur dans ECX
	sub cl, '0' ; erreur 5 : on veut le nombre, pas le code ASCII
	shl ecx, 1
	inc ecx
boucle:
	push ecx ; erreur 3 : oubli du PUSH
	mov eax, 4
	mov ebx, 1
	mov ecx, valeur ; erreur 2 : oubli de cette ligne
	mov edx, 1
	int 80h
	pop ecx
	loop boucle
	mov eax, 1 ; erreur 1 : il faut EAX=1 pour quitter
	xor ebx, ebx
	int 80h
