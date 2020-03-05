section .data

chiffre db 0
eol db 10

section .text

global _start

_start:
    mov eax, 1234
    boucle:
        cmp eax, 0
        je fin
        mov edx, 0
        mov ebx, 10
        idiv ebx
        add edx, '0'
        mov [chiffre], dl
        push eax
        mov eax, 4
        mov ebx, 1
        mov ecx, chiffre
        mov edx, 1
        int 80h
        pop eax
        jmp boucle
fin:
    mov eax, 4
    mov ebx, 1
    mov ecx, eol
    mov edx, 1
    int 80h
    mov eax, 1
    mov ebx, 0
    int 80h
