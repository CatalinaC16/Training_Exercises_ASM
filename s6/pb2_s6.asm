.386
.model flat, stdcall

includelib msvcrt.lib

extern fprintf: proc
extern gets: proc
extern printf: proc
extern scanf: proc
extern _strrev: proc
extern fopen: proc
extern fclose: proc
extern exit: proc

public start

.data

sir db 40 dup(0)
format db "%s",0
nume_fisier db "fisier.txt",0
mod_deschidere db "w"


.code
start:

   push offset sir
   call gets
   add esp, 4
  
   push offset sir
   call _strrev 
   add esp,4
     
   push offset mod_deschidere
   push offset nume_fisier
   call fopen
   add esp,8
   mov ebx,eax
   
   push offset sir
   push offset format
   push eax
   call fprintf
   add esp,12
   
   push ebx
   call fclose
   add esp,4
   
	push 0
	call exit
end start
