.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern printf: proc

public start

.data

sir dd 1,2,3,4,5,6,7
lgsir dd $-sir
format db "%d",0
primul dd 0
mijloc dd 0
ultimul dd 0
nr dd 6
da db "GASIT in sir",0
nu db "NU a fost GASIT",0

.code

bsearch proc

    mov eax,lgsir
	xor edx,edx
	shr ecx,2
	mov ecx,eax
	dec ecx
	
    mov ultimul,ecx

start_cautare: 
    mov eax,primul
    cmp eax,ultimul
    jg stop_cautare               
    
    add eax,ultimul 
    shr eax,1
    mov mijloc,eax

    mov esi,eax
    mov edx,sir[esi*4] 
    
    cmp edx,nr
    jge mai_mic
	
    mov eax,mijloc               
    inc eax
    mov primul,eax
    jmp start_cautare

mai_mic:
   
    cmp edx,nr
    jle gasit
	
    mov eax,mijloc              
    dec eax
    mov ultimul,eax
    jmp start_cautare

gasit: 

    mov eax,1                
    ret                              

stop_cautare: 

	mov eax,0   
   ret        
	
bsearch endp

start:
	call bsearch
	cmp eax,0
	je nu_gasit
	
	push offset da
	call printf
	jmp iesire
	
	nu_gasit:
		push offset nu
		call printf
	
iesire:	
	push 0
	call exit
end start
