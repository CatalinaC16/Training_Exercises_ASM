.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fscanf: proc
extern printf: proc
extern fclose: proc
public start

.data
mod_deschidere db "r",0
nume_fisier db "fisier2.txt",0
var1 dd 0
nume1 db 20 dup(0)
var2 dd 0
nume2 db 20 dup(0)
format_citire db "%s %d %s %d",0

.code
start:
	push offset mod_deschidere
	push offset nume_fisier
	call fopen
	add esp,8
	;in eax pointer fisier2
    mov ebx,eax
	push offset var1
	push offset nume1
    push offset var2
	push offset nume2	
	push offset format_citire
	push eax 
	call fscanf
	add esp,12
		
	
	push var1
	push offset nume1
    push var2
	push offset nume2
	push offset format_citire
    call printf
	add esp,12
	
	push ebx
	call fclose
	add esp,4
	
	
	push 0
	call exit
end start
