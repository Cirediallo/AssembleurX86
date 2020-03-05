section .data
	end: db 'Fin du programme'
	elen: equ $-end
	n: dd 5
	eol: db 10

section .txt
global _start

Ecrirenombre:
	push -1; ceci nous sert de point d'arrêt
	cmp eax, 9
	je print

	division:
		mov edx, 0
		mov ecx, 10

		div ecx; divise edx:eax par 10 quotient dans eax, reste dans edx
		push edx; on sauvegarde le reste 

		cmp eax, 9
		ja division

	print:
		mov [n], eax
		add byte [n], '0'

		mov eax, 4
		mov ebx, 1
		mov ecx, n
		mov edx, 1
		int 80h
		
		pop eax; on passe au chiffre suivant à afficher
		cmp eax, -1
		jne print
	ret; sans ce ret on a une boucle infini
	

_start:

	mov eax,5896; on met un nombre dans eax
	call Ecrirenombre

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
