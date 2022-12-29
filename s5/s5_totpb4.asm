.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern strstr: proc
extern printf: proc
public start

.data

s2 db "aplicatie",0
s1 db "cat",0
format db "%s",0
.code
start:

   mov eax,-1
   
   push offset s1
   push offset s2
   call strstr
   add esp,8
   
   push eax
   push offset format
   call printf
   add esp,8
   
	push 0
	call exit
end start
