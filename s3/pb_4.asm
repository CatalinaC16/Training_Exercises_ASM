.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

x DW 16

.code

start:

   push x
   push x
   pop eax
   pop ebx
   sub ebx,1
   and eax,ebx
    
    
 push 0
   
  call exit
end start
