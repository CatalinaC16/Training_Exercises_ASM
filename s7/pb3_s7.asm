.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc

include mylib.asm

public start

.data

format db "%d",13,10,0
format2 db "%d %d",0

.code

functie proc
   inc eax
   ret
functie endp

apel0 macro func
   call func
endm

apel1 macro func,param1
   push param1 
   add param1,10
   call func
   add esp,4  
endm
 
apel2 macro func,param1,param2
	push param2
	push param1
	call func
	add esp,8
endm

apel3 macro func,param1,param2,param3
    push param3
	push param2
	push param1
	call func
	add esp,12
endm	

start:
   mov eax,3
   apel0 functie
   apel1 functie,eax
   apel2 printf,offset format,eax
   xor eax,eax
   mov edx,9
   apel3 printf,offset format2,eax,edx
   
	push 0
	call exit
end start
