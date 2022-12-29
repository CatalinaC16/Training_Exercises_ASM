.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc

include mylib.asm

public start

.data

format db "%d",0
var dd 0

.code

print macro nr
	push nr
	push offset format
	call printf
	add esp, 8
endm

suma macro nr

local suma_continuare,suma_stop

  push ebx
  mov ebx,1
  suma_continuare:
  add eax,ebx
  add ebx,2
  cmp ebx, nr
  jbe suma_continuare
 
 suma_stop:
 pop ebx
endm

start:
    
	xor eax,eax
    suma 10
	print eax
	push 0
	call exit
end start
