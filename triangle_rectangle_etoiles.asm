section .data
message1 db '*'
message2 db 10
n db 7
section .text
global _start
_start:
xor edx, edx
boucle1:
xor ecx, ecx
mov cl, [n]  ;<======== Error 1
sub ecx, edx ; <======= Error 2
push edx
boucle2:
push ecx
mov eax, 4
mov ebx, 1
mov ecx, message1
mov edx, 1
int 80h
pop ecx
loop boucle2
mov eax, 4
mov ebx, 1
mov ecx, message2 ;<========= Eroor 3
mov edx, 1
int 80h
pop edx ; <======== Error 4
inc edx
cmp dl, [n]
jb boucle1 ; <====== Error 5
mov eax, 1
xor ebx, ebx
int 80h
