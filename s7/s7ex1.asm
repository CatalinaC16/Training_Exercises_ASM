.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc

include mylib.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
format db "%d", 13, 10, 0
my_int dd 0
.code
show_int macro nr
	push nr
	push offset format
	call printf
	add esp, 4
endm

start:
	factorial 3
	show_int eax
	mov ecx, 10
	factorial ecx
	show_int eax
	factorial my_int
	show_int eax
	;terminarea programului
	push 0
	call exit
end start
