.586
.model flat, stdcall

includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern exit: proc


public start

.data

fr_nr db "%d",0
format db "ghiceste numar ",0
format_mic db "mai mic ",0
format_mare db "mai mare ",0
format_egal db "ai ghicit ",0
val dd 0

.code
start:
  rdtsc
  xor ebx,ebx
  mov ebx,eax
  xor ecx,ecx
  ;afisez valoarea random
  push ebx
  push offset fr_nr
  call printf
  
  push offset format
  call printf 
  add esp,4
  
citire:
  push offset val
  push offset fr_nr
  call scanf
  add esp,8
  cmp ebx,val
  jg mare
  jl mic
  je egal
  
  
mare:
  inc ecx
  push offset format_mare
  call printf
  add esp,4
  jmp citire

mic:
  inc ecx
  push offset format_mic
  call printf
   add esp,4
  jmp citire
  
egal:
 push offset format_egal
 call printf
  add esp,4
	push 0
	call exit
end start
