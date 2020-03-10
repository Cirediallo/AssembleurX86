section .data
	message db '@.', 10 ; erreur 3 : le message contient '@' et '.'
section .text
global _start
_start:
	xor edi, edi
	mov ecx, 8 ; erreur 1 : initialisation du nombre de lignes a 8
	boucle1:
		push ecx
		mov ecx, 8
		boucle2:
			push ecx
			mov eax, 4
			mov ebx, 1
			mov ecx, message
			add ecx, edi ; erreur 4 : on doit alterner '@' et '.'
			mov edx, 1
			int 80h
			pop ecx
			xor edi, 1 ; erreur 5 : on doit alterner 0 et 1 a chaque colonne
			loop boucle2
		xor edi, 1
		mov eax, 4
		mov ebx, 1
		mov ecx, message+2
		int 80h
		pop ecx
		loop boucle1
	mov eax, 1
	xor ebx, ebx
	int 80h ; erreur 2 : il faut quitter le programme
