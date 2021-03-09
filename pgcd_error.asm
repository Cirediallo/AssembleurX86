fonction:
cmp eax, ebx
je fin  ; <====== Error 1
jb minus ; <====== Error 2
push eax ; <======= Error 3 this line must not exit in the program
sub eax, ebx
jmp fonction
minus:
sub ebx, eax
jmp fonction ;<====== Error 4
fin:
int 80h ; <====== Error 5 this line must not exist we are in a function
ret
