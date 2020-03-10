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
	mov cl, [valeur] ; erreur 1 : [valeur] est sur 8 bits
	sub cl, '0' ; erreur 5 : on doit recuperer le 'nombre' n, pas la 'lettre'
	;mov bl, cl ;erreur 2 : permet de faire 3*x avec (x+x)+x 
	; <<commentaire perso>> we don't need the line above (mov bl, cl)
	add cl, cl
	add cl, bl
	add cl, 7
boucle:
	push ecx ; erreur 3 : pour sauvegarder "i"
	mov eax, 4
	mov ebx, 1
	mov ecx, valeur
	mov edx, 1
	int 80h
	pop ecx ; erreur 4 : pour recuperer "i"
	loop boucle
	mov eax, 1
	xor ebx, ebx
	int 80h
