.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc
public start

.data
vector db 3,0,10,3,4
lung db $-vector
format db "%d",0
media db 0
.code
start:

  ;mov esi,offset vector
  lea esi,vector
  xor ebx,ebx
  xor ecx,ecx
  mov cl,lung
  
	eti: 
	 
	 add bl, byte ptr [esi]
	 inc esi
	loop eti
	
	xor edx,edx
	mov eax,ebx
	div lung
	
	push eax
	push offset format
	call printf
	add esp,8
	push 0
	call exit
end start