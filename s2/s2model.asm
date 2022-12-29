.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
sir db 1,2,3
sir2 dd 14,56,22
.code
start:
	;aici se scrie codul
	mov esi,0
	xor eax,eax
	mov al, sir[si+1]

	mov edx,0
	mov ebx,0
	mov ebx,sir2[edx]
     add edx,8
	 mov ebx,sir2[edx]
	;terminarea programului
	push 0
	call exit
end start
