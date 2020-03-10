section .data ;<======= erreur 6 : il fallait mettre section
	message db 'A', 10
section .text
global _start
_start:
	mov ecx, 26 ;<======= erreur 1 : il faut utiliser ECX et non pas CL
boucle:
	push ecx
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	cmp ecx, 1
	ja suite ;<========= erreur 2 : on affiche deux caracteres si i>1 (pas i<1)
	inc edx
suite:
	mov ecx, message
	int 80h
	inc byte [ecx] ;<======= erreur 4 : il faut specifier la taille de la zone mem.
	pop ecx ;<========= erreur 3 : il faut recuperer la valeur de i dans ECX
	loop boucle ;<====== erreur 5 : il faut decrementer ECX, le comparer a 0, et revenir au debut de la boucle
	mov eax, 1
	xor ebx, ebx
	int 80h
