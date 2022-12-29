.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
mat1 db 1,2,3,4
     db 5,6,7,8
	 
mat2 db 1,1,1,1
     db 1,1,1,1

.code
start:

	mov esi,offset mat1
	mov edi,offset mat2
	mov ecx,8
	
	eti:
	
	mov al,byte ptr[esi]
	add al,byte ptr[edi]
	mov byte ptr[esi],al
	inc edi
	inc esi
	loop eti

	push 0
	call exit
end start
