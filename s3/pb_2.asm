.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
;rez = AX*num1 + num2*(AX + BX)

num1 DW 10 
num2 DW 5
rez DW 0

.code

start:

   mov ax,3
   push ax
   mov num1,2
   mul num1
   add rez,ax
   
   pop  ax
   mov num2,1
   mov bx,2
   add ax,bx
   mul num2
   add rez,ax

push 0
	call exit
end start
