.386
.model flat, stdcall

includelib msvcrt.lib
extern fprintf: proc
extern fscanf: proc
extern printf: proc
extern scanf: proc
extern fopen: proc
extern fclose: proc
extern fgets: proc
extern fputs: proc
extern fseek: proc
extern exit: proc

public start

.data

sir db 20 dup(0)

nume_fisier_citit db "fcitire.txt",0
nume_fisier_scris db "fscriere.txt",0

mod_deschidere1 db "r",0
mod_deschidere2 db "w",0

pointer_fis1 dd 0
pointer_fis2 dd 0

format db "%s",0
var dd 0
var2 dd 0
.code
start:
  	
   ;deschid fisier de citit	
   push offset mod_deschidere1
   push offset nume_fisier_citit
   call fopen
   add esp,8
     
   mov pointer_fis1,eax
   mov eax,0  
      
   ;deschid fisier in care o sa scriu
   push offset mod_deschidere2
   push offset nume_fisier_scris
   call fopen
   add esp,8
   
   mov pointer_fis2,eax
   xor eax,eax
   xor ecx,ecx
   
eticheta:   
 
   push pointer_fis1
   push 20
   push offset sir 
   call fgets
   add esp,12
   
  inc var
  cmp eax,0
  
jne eticheta

   dec var
   
scrie:
  push offset sir
  push offset format
  push pointer_fis2
  call fprintf
 add esp,12

dec var
   push 0
   push 0
   push pointer_fis1
   call fseek
   add esp,12
mov ebx,var
mov var2,0


fis:

   push pointer_fis1
   push 20
   push offset sir 
   call fgets
   add esp,12
   inc var2
   
cmp ebx,var2
je scrie
jg fis

push pointer_fis1
call fclose
add esp,4

push pointer_fis2
call fclose
add esp,4
	push 0
	call exit
end start
