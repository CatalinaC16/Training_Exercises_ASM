.386
.model flat, stdcall

includelib msvcrt.lib

extern fprintf: proc
extern fscanf: proc
extern printf: proc
extern scanf: proc
extern fopen: proc
extern fclose: proc
extern exit: proc

public start

.data
;citim sir din fisier si afisam inversat in fisier

caracter dd 10 dup(0)
format db "%c",0
nume_fisier db "fis.txt",0
mod_deschidere1 db "r",0
mod_deschidere db "w",0
spatiu dd " ",0
.code
start:

  push offset mod_deschidere1
  push offset nume_fisier
  call fopen
  add esp,8
  mov esi,eax
  ;pointer fisier in eax
  
  xor ebx,ebx
  
  citire:
  push offset caracter
  push offset format
  push eax
  call fscanf
  add esp,12  
   
  
  cmp eax,0
  je final
  mov edx,caracter
  push edx
  inc ebx
  jmp citire
  
  final:
  push esi
  call fclose
  add esp,4
  
  push offset mod_deschidere
  push offset nume_fisier
  call fopen
  add esp,8
  
  pop ebx  
  push ebx
  push offset format
  push eax
  call fprintf
  add esp,8
  
  
	push 0
	call exit
end start
