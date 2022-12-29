.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data


s2 db "aplicatie",0
s1 db "cat",0

.code
start:

    mov ax,0
    mov al,s1
	lea edi,s2
	lea si,s1
	mov ebx, edi
	mov ecx, 9
    repne scas s2

	mov edx,edi
	sub edx,ebx
	dec edi
	mov ecx,3

		
	repe cmpsb 
	jnz eti
	mov eax,edx
	jmp sfarsit
    eti:
	mov eax,-1

	sfarsit:
	push 0
	call exit
end start
