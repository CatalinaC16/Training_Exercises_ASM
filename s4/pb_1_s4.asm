.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
vector db 3,0,10,3,4
media db 0
.code
start:

	mov ax,0
	mov esi,0
	add al,vector[esi]
	inc esi
	add al,vector[esi]
	inc esi
	add al,vector[esi]
	inc esi
	add al,vector[esi]
	inc esi
	add al,vector[esi]

	
	mov edx,0
	mov cl,5
	div cl
	mov media,al
	
	
	push 0
	call exit
end start