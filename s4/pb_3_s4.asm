.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data


.code
start:
 ;am pus pe stiva si dupa le-am scos in ordinea ceruta
    mov eax,0
    mov ebx,0
    mov ecx,0
	mov edx,0
	
	mov eax,5
	mov ebx,9
	mov ecx,7
	mov edx,3
	
	push eax
	push ebx
	push ecx
	push edx
	
	pop eax
	pop edx
	pop ecx
	pop ebx
	
	push 0
	call exit
end start
