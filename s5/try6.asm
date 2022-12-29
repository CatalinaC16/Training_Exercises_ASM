.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
sir db 10,21,3,14,2,22,11
lgsir db $-sir
format db "minim %d maxim %d",0
.code
start:
	xor eax,eax
	xor edx,edx
	xor esi,esi
	
	;min
	mov al,sir[esi]
	;max
	mov dl,sir[esi]
	
	inc esi
	
	xor ecx,ecx
	mov cl,lgsir
	
	eti: 
		  cmp al,sir[esi]
		  jbe et
		  mov al,sir[esi]
		  
		  et:
		  cmp dl,sir[esi]
		  jae et2
		  mov dl,sir[esi]
		et2:
		inc esi
		
	loop eti
	
	push edx
	push eax
	push offset format
	call printf
	add esp,12
	
	;apel functie exit
	push 0
	call exit
end start

