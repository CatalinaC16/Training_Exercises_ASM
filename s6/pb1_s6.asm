.386
.model flat, stdcall

includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern exit: proc

public start

.data
var1 dd 0
var2 dd 0
format db "%d %d",0 
format2 db "suma numerelor este %d",0

.code
start:

   push offset var1
   push offset var2
   push offset format
   
   call scanf
   add esp, 12
   
   mov ebx,var1
   mov ecx,var2
   add ebx, ecx
   
   push ebx
   push offset format2
   call printf
   add esp,8
   
	push 0
	call exit
end start
