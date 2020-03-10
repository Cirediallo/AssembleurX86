;#include <stdio.h>
;int main(void) {
;	int i, j, n;
;	printf("Entrez un chiffre : ");
;	scanf("%d", &n);
;	for (i=0; i<n; i++) {
;		for (j=0; j<2*n-1; j++) {
;			if ((i==j) || (i==2*n-j-2)) {
;				printf("*");
;			}else {
;				printf(".");
;			}
;		}
;		printf("\n");
;	}
;}





section .data

n db 0
message db 'Entrez un chiffre : '
length equ $-message
etoile db '*'
point db '.'
retour db 10

section .text
global _start
_start:
	; printf
	mov eax, 4
	mov ebx, 1
	mov ecx, message
	mov edx, length
	int 80h
	; scanf
	mov eax, 3
	mov ebx, 0
	mov ecx, n
	mov edx, 1
	int 80h
	sub byte [n], '0' ; attention a ne pas oublier cette soustraction !
	mov cl, [n] ; calcul de 2n-1
	add cl, cl
	dec cl
	mov eax, 0 ; EAX represente la variable "i"
boucle1:
	mov ebx, 0
	boucle2:
		; debut du IF
		cmp eax, ebx
		je affichage_etoile
		mov dl, [n]
		add dl, dl
		sub dl, bl
		sub dl, 2
		cmp al, dl
		je affichage_etoile
		jmp affichage_point

		affichage_etoile:
			push eax
			push ebx
			push ecx
			mov eax, 4
			mov ebx, 1
			mov ecx, etoile
			mov edx, 1
			int 80h
			pop ecx
			pop ebx
			pop eax
			jmp fin_if

		affichage_point:
			push eax
			push ebx
			push ecx
			mov eax, 4
			mov ebx, 1
			mov ecx, point
			mov edx, 1
			int 80h
			pop ecx
			pop ebx
			pop eax

		; fin du IF
		fin_if:
		inc ebx
		cmp bl, cl
		jb boucle2
	; printf(\n)
	push eax
	push ecx ; parce que ECX stocke 2n-1
	mov eax, 4
	mov ebx, 1
	mov ecx, retour ; (on ecrase ECX)
	mov edx, 1
	int 80h
	pop ecx ; on recupere ECX (avant EAX)
	pop eax
	inc eax
	cmp al, [n]
	jb boucle1
	; exit
	mov eax, 1
	mov ebx, 0
	int 80h
