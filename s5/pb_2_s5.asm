.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
public start

.data
format db "%d",0
sir Db 9,-4,-5,1
lg_sir dd $-sir
.code
start:

	mov esi,0
	mov ebx,0
	mov ecx, lg_sir
	
	loop_sir:
	
	add bl,sir[esi]
	inc esi
	
	loop loop_sir
	
	
push ebx
push offset format
call printf
add esp,8	

	push 0
	call exit
end start
