.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data

sir dw 14,25,23,-26,78,-2
lgsir dd $-sir
min dw 0
max dw 0

.code
start:
	mov eax,0
	mov ebx,0
	mov esi,0 
	
	mov ecx, lgsir
	mov ax, sir[esi]
	mov bx, sir[esi]
	
	loop_1:
	
	cmp ax, sir[esi]
	JL cmp_max
	mov ax, sir[esi]
	
	cmp_max:
	cmp bx, sir[esi]
	JG urmator
	mov bx, sir[esi]
	
	urmator:
	add esi,2
	
	loop loop_1
	
	mov min, ax
	mov max, bx
	
	push 0
	call exit
end start
