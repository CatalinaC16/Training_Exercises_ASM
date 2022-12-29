.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

var DD 0

.code

start:

   mov eax, 12345678h
   mov var,eax
   rol var,8
   xchg eax,var   

   push 0
   
  call exit
end start
