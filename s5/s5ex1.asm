.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
sir db 10,21,3,14,2,22,11
lgsir dd $-sir
min db 0
max db 0 
	
.code
start:
	
	mov ax, 0 ; al-minim, ah-maxim
	
	mov esi, 0
	mov ecx, lgsir
	mov al, sir[esi]
	mov ah, sir[esi]

	et_loop:
		cmp al, sir[esi]
		JB cmp_max
		mov al, sir[esi]
		
		cmp_max:
		cmp ah, sir[esi]
		JA urmator
		mov ah, sir[esi]
		
		urmator:
		inc esi	
	loop et_loop
	
	mov min, al
	mov max, ah
	
	;apel functie exit
	push 0
	call exit
end start

